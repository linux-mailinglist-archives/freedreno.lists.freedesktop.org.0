Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 984379F4AC5
	for <lists+freedreno@lfdr.de>; Tue, 17 Dec 2024 13:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CD710E959;
	Tue, 17 Dec 2024 12:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hDaf9b2b";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54A110E226
 for <freedreno@lists.freedesktop.org>; Tue, 17 Dec 2024 12:14:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 47CE6A40ACB;
 Tue, 17 Dec 2024 12:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35442C4CED4;
 Tue, 17 Dec 2024 12:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734437650;
 bh=Me423sa5I67z9UM4znPFMq2P7Rm7CICtNtEVzRss7kY=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=hDaf9b2bvvMJ1/Jkx+IK+tRESOpOWyyDu3Ef0Wg+UyqQW+2w7YYT+os++DM6MeQQu
 hYIe61BEhARPSwGkRXUhM7+gc332hwepEBZrO9thhLqX74LMITzQuWo7SgpP4mBaFJ
 hNpNyKV/tEEQvmDF60/uxKGYhYGmwJoxHQ1Jpa1tVWCSkE9P2Jcmc7QJPeHbW0Yvc3
 gUXHnn36/Wp99YAMBMG7dlB6AZ2ZDMwT2F8gfQzXgHDxDie9eLMB+S7iMQT3glOAZx
 qeCH5longT0/T3MGvfzjJagC9GiNIEWDQCzZLzPzptdS8lb9kgmbGGbPoMQVeSOcU1
 BaizcBBk9JY1w==
Message-ID: <4fa319f13b4d57580a3a9e38021882a4@kernel.org>
Date: Tue, 17 Dec 2024 12:14:07 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 04/25] drm/tests: Add test for
 drm_atomic_helper_check_modeset()
In-Reply-To: <20241216-concurrent-wb-v4-4-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-4-fe220297a7f0@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_abhinavk@quicinc.com, quic_ebharadw@quicinc.com,
 DavidAirlie <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
 JessicaZhang <quic_jesszhan@quicinc.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Rob Clark" <robdclark@chromium.org>, "Rob
 Clark" <robdclark@gmail.com>, "Sean Paul" <sean@poorly.run>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Transfer-Encoding: 7bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 16 Dec 2024 16:43:15 -0800, Jessica Zhang wrote:
> Add a test for drm_atomic_check_modeset() specifically to validate
> drm_atomic_check_valid_clones() helper
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
