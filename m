Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B7F188535
	for <lists+freedreno@lfdr.de>; Tue, 17 Mar 2020 14:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8747B6E116;
	Tue, 17 Mar 2020 13:20:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45AA6E116;
 Tue, 17 Mar 2020 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XvzyhaFk/wu7skK/5j6uwYlT+ZJkYaLS7Iej2CpX2yI=; b=QW2VmaGzcPNbAM0cpTRfclXlIy
 dOyw2GWUIcqv9bO9vI+4WYLEeyBx0PY04xYG+ZM6PmYLvMPWOIhPPcqp2kqFUT5JssJxyZ5id7qgn
 EYdU43apJV2k/VVcfrVd4Drha7iaa0Q1/Ig9V51k0XqeXgBx9lH8mgYkOgR8DQfPikCgKLT2UDluT
 uCAm47h316v3IXPEQ33SkyWLSbKeR68GYo3fJG7Ng3cmwqSIAKGS5TAUMza4aMWHF9G2wvSTySgso
 Pdnt/J5kJIpFdJE681LWl67wzH4aSzCsTOX1pgB0X9R6sh+tLQqUfkkAN1l8uKyGQHcg3Nk/5OM9W
 Q+CZKxYw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jEC91-00080e-P0; Tue, 17 Mar 2020 13:20:31 +0000
Date: Tue, 17 Mar 2020 06:20:31 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Message-ID: <20200317132031.GA8125@infradead.org>
References: <1583767066-1555-1-git-send-email-jcrouse@codeaurora.org>
 <1583767066-1555-3-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583767066-1555-3-git-send-email-jcrouse@codeaurora.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Freedreno] [PATCH v5 2/2] drm/msm/a6xx: Use the DMA API for
 GMU memory objects
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
Cc: freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 smasetty@codeaurora.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Rob Clark <robdclark@gmail.com>,
 John Stultz <john.stultz@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

> @@ -942,7 +932,6 @@ static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
>  		size_t size)
>  {
>  	struct a6xx_gmu_bo *bo;
> -	int ret, count, i;
>  
>  	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
>  	if (!bo)
> @@ -950,86 +939,14 @@ static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
>  
>  	bo->size = PAGE_ALIGN(size);
>  
> -	count = bo->size >> PAGE_SHIFT;
> +	bo->virt = dma_alloc_wc(gmu->dev, bo->size, &bo->iova, GFP_KERNEL);

No really new in this patch, but why do you need the a6xx_gmu_bo,
and even more so, why does it need to be allocated dynamically?

Also please check for errors when setting the dma mask
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
