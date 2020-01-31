Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE26414F43A
	for <lists+freedreno@lfdr.de>; Fri, 31 Jan 2020 23:00:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682DF6E260;
	Fri, 31 Jan 2020 22:00:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AD06E260
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jan 2020 22:00:45 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id e8so664834plt.9
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jan 2020 14:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=b82MM5TsQ8A9XNdp0Y7iZIjPTfIvG0TXd9OXwa8Voa4=;
 b=ln975L+nUDW8vHW1M3ExHfHLl4zJ6xQ7xAqDPH8kgpaC2M25g/M0mpJXtoR9nZ8+zX
 fCKziGOUYvBuahWMFfMcvJFOCeQJEiH1U3THEAK/GpEkWuPqWgoraNYhdLCyxaDPJZk7
 8hf9/Az5nYC2xFao/C79k4QgNJRVjrt4tf2rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b82MM5TsQ8A9XNdp0Y7iZIjPTfIvG0TXd9OXwa8Voa4=;
 b=G1ygk3dyqjP8xFORvmkg/Sb6ZEXZIr7h2PYMcLq7jCXelB5BQPk5eZaIDJjouqar/x
 WlkpD4L+4dIfiameeaDcwibgM065F/O7sfI3RtUzidU4G2zqfwsH1Dff51PH1naToX09
 0RKw1a437cMCK7ME9XimgMu7IXL3cK4hkEoiH53Whwcw2keBgmV3IGhG6S7bM1jll7c1
 muyI9vQt2Y25U2CoQSbfx9BK0jCYqf4UhyZ3pKz7JTCuywHJnJqXpc2uJ13bcXk55y4h
 +VD83mhJZ4Z7XGsKAbM507NNHJv9ajyOBbQ4x0y8sTVkKvJyusjnd+baaspBh4QvjDMh
 IzNQ==
X-Gm-Message-State: APjAAAV4XDSGXHvQPSnb3OZlX+OjpIPTPWFyjW5xCciKwbsLzykx7ZH0
 9RBI9nu35asaq5R1rG+NfdyutA==
X-Google-Smtp-Source: APXvYqxJ4dABMrxvg8Mkn8WWBjXAgyn0FUDu4pBM/f8rqnl3BFmy/f1OIqxj6WnyNvD4RpAWCJnROA==
X-Received: by 2002:a17:90a:36af:: with SMTP id
 t44mr14554287pjb.25.1580508045310; 
 Fri, 31 Jan 2020 14:00:45 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id g2sm11436046pgn.59.2020.01.31.14.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2020 14:00:44 -0800 (PST)
Date: Fri, 31 Jan 2020 14:00:43 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <20200131220043.GN71044@google.com>
References: <1577962933-13577-1-git-send-email-smasetty@codeaurora.org>
 <1577962933-13577-2-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1577962933-13577-2-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH v2 1/7] iommu/arm-smmu: Pass io_pgtable_cfg
 to impl specific init_context
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
Cc: freedreno@lists.freedesktop.org, saiprakash.ranjan@codeaurora.org,
 jcrouse@codeaurora.org, will@kernel.org, linux-arm-msm@vger.kernel.org,
 joro@8bytes.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, dri-devel@freedesktop.org,
 robin.murphy@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Jan 02, 2020 at 04:32:07PM +0530, Sharat Masetty wrote:
> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Pass the propposed io_pgtable_cfg to the implementation specific
> init_context() function to give the implementation an opportunity to
> to modify it before it gets passed to io-pgtable.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm-smmu-impl.c |  3 ++-
>  drivers/iommu/arm-smmu.c      | 11 ++++++-----
>  drivers/iommu/arm-smmu.h      |  3 ++-
>  3 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
> index b2fe72a..33ed682 100644
> --- a/drivers/iommu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm-smmu-impl.c
> @@ -68,7 +68,8 @@ static int cavium_cfg_probe(struct arm_smmu_device *smmu)
>  	return 0;
>  }
> 
> -static int cavium_init_context(struct arm_smmu_domain *smmu_domain)
> +static int cavium_init_context(struct arm_smmu_domain *smmu_domain,
> +		struct io_pgtable_cfg *pgtbl_cfg)
>  {
>  	struct cavium_smmu *cs = container_of(smmu_domain->smmu,
>  					      struct cavium_smmu, smmu);
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index eee48f9..4f7e0c0 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -758,11 +758,6 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  		cfg->asid = cfg->cbndx;
> 
>  	smmu_domain->smmu = smmu;
> -	if (smmu->impl && smmu->impl->init_context) {
> -		ret = smmu->impl->init_context(smmu_domain);
> -		if (ret)
> -			goto out_unlock;
> -	}
> 
>  	smmu_domain->pgtbl_cfg = (struct io_pgtable_cfg) {
>  		.pgsize_bitmap	= smmu->pgsize_bitmap,
> @@ -773,6 +768,12 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  		.iommu_dev	= smmu->dev,
>  	};
> 
> +	if (smmu->impl && smmu->impl->init_context) {
> +		ret = smmu->impl->init_context(smmu_domain, &smmu_domain->pgtbl_cfg);

Which patch adds 'pgtbl_cfg' to struct arm_smmu_domain? The field does
not exist in iommu/next.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
