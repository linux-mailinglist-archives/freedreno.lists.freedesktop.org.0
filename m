Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1957B1AE7
	for <lists+freedreno@lfdr.de>; Thu, 28 Sep 2023 13:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D80C10E60F;
	Thu, 28 Sep 2023 11:24:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0562A10E60D;
 Thu, 28 Sep 2023 11:24:54 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B1C106607337;
 Thu, 28 Sep 2023 12:24:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695900292;
 bh=CppPHmkoLt+zjmY2qAg60/g1MggRcPf5o7BrilZYcSM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NsftOWZCWUP2/39arzsyP0pYJZPB9p7utGw2Z/2IiqZb7hZM5lDxEd/KLlSOzY2pn
 mKVHuopcahUsicUAE8y4EPA/gRHwbvPuCY1bKnnyJOHaSH+QFYqsJwWncfIy/oCnR3
 ceoMqcG3ODtVkGg8GCuKkcub4N4h4+OtWzhYkdnovbGRkdeED+uBISZJEtMat3zYuW
 OMO4Oi17EDMX2cS0ULtKlm3zO2t6W7T+T7rXD74kAhWeXWb4eFDiVnky9+6GkHnxTa
 jSDCcozJyMNUeuhUBk3imaFOGo04EH/V/LsisDbHBDFvQ8aFjn4Xko+cZNgwl1IIDT
 zgIt+K/jVXYBA==
Message-ID: <df035e27-b19e-fd4c-d31c-316d526afc4f@collabora.com>
Date: Thu, 28 Sep 2023 13:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
References: <20230927213133.1651169-1-adrian.larumbe@collabora.com>
 <20230927213133.1651169-5-adrian.larumbe@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927213133.1651169-5-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v7 4/5] drm/drm_file: Add DRM obj's RSS
 reporting function for fdinfo
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@linux.intel.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 healych@amazon.com, boris.brezillon@collabora.com, kernel@collabora.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Il 27/09/23 23:29, Adrián Larumbe ha scritto:
> Some BO's might be mapped onto physical memory chunkwise and on demand,
> like Panfrost's tiler heap. In this case, even though the
> drm_gem_shmem_object page array might already be allocated, only a very
> small fraction of the BO is currently backed by system memory, but
> drm_show_memory_stats will then proceed to add its entire virtual size to
> the file's total resident size regardless.
> 
> This led to very unrealistic RSS sizes being reckoned for Panfrost, where
> said tiler heap buffer is initially allocated with a virtual size of 128
> MiB, but only a small part of it will eventually be backed by system memory
> after successive GPU page faults.
> 
> Provide a new DRM object generic function that would allow drivers to
> return a more accurate RSS and purgeable sizes for their BOs.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

