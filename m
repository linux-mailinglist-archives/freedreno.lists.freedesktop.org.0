Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F26B24BB5
	for <lists+freedreno@lfdr.de>; Wed, 13 Aug 2025 16:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3724310E1E6;
	Wed, 13 Aug 2025 14:16:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 392 seconds by postgrey-1.36 at gabe;
 Tue, 12 Aug 2025 09:05:18 UTC
Received: from hs01.dakr.org (hs01.dakr.org [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F1410E110
 for <freedreno@lists.freedesktop.org>; Tue, 12 Aug 2025 09:05:18 +0000 (UTC)
Message-ID: <b0a36f3d-706a-4622-89a1-f88c6255e4fb@dakr.org>
Date: Tue, 12 Aug 2025 10:58:42 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v9 14/42] drm/msm: Convert vm locking
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
 <20250629201530.25775-15-robin.clark@oss.qualcomm.com>
From: Danilo Krummrich <kernel@dakr.org>
Content-Language: en-US
In-Reply-To: <20250629201530.25775-15-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 13 Aug 2025 14:16:28 +0000
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

On 6/29/25 10:12 PM, Rob Clark wrote:
> +	/*
> +	 * We mostly want to use DRM_GPUVM_RESV_PROTECTED, except that
> +	 * makes drm_gpuvm_bo_evict() a no-op for extobjs (ie. we loose
> +	 * tracking that an extobj is evicted) :facepalm:
> +	 */

Yeah, it's a consequence of this locking scheme and I really hate it. However,
you don't entirely loose tracking:

The next time you call drm_gpuvm_prepare_objects() it will be added to the list
[1] and hence picked up by subsequent validation through drm_gpuvm_validate().

[1] https://elixir.bootlin.com/linux/v6.16/source/drivers/gpu/drm/drm_gpuvm.c#L1154
