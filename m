Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE559E374D
	for <lists+freedreno@lfdr.de>; Wed,  4 Dec 2024 11:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2262010ECB6;
	Wed,  4 Dec 2024 10:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="pEkYgoFP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AAB10ECB6
 for <freedreno@lists.freedesktop.org>; Wed,  4 Dec 2024 10:14:10 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4349338add3so38145e9.0
 for <freedreno@lists.freedesktop.org>; Wed, 04 Dec 2024 02:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733307249; x=1733912049;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BMGnNPxPYgtjLytE4uW9hhJz+Jg05BhCFp2UIgwDwC0=;
 b=pEkYgoFPDH23kycsN/1RqRIb92ycM1KLvJY3ibec/YMFZj4+cAHVmfBc1Gmpl1V9/z
 674KJGBhc/7cmiGP7NajPwc+2eS0ztHqJiD10NplnpsvFVUyt9AsoNfc7LVqpECvVdjE
 f9HHNCeaOa+7RPiWeW94Zw6iDoYhi1ByWKbgoM8pFebKEcOKzJNgFcBlTV9OcWdcpZ6j
 /WPoUJgEdRYUzxcgMQAJ/Tt4KY1L5r1aavLG/VxIFfBZSGB/87MxpqBu9nygLIdKEs2+
 9sqryAFLloegQ9iqpLmdW8oZSzr46xaxYnnWzrkpPy7DEebuc5334djHMYgsWRA+Oh2T
 8sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733307249; x=1733912049;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMGnNPxPYgtjLytE4uW9hhJz+Jg05BhCFp2UIgwDwC0=;
 b=ndGf/hMwWbVfb1o8nuiFETgIF9SggULQpu6qsmEwHkPGnJBSKc5Ni06C9zG9JBSSlR
 7W9CjucuKJ5CISvHhTcK98wLxOZMZuKVI/JBjYCydtsbYLLy+9NdSrLW0tHU9eKMKNu0
 SACVHeCttPXKfneKoltSzb96LJYY+6aLMIesd0DJMKoD+CJpzXcuQ99GjarT5495OtKn
 zmiYzLVRMX25r7Hu1f4jCCSE8mLkTspA1Ifi7albGdTxUiuS4ngkNjQ5DBA/I/Isd9hZ
 Y1DGD06Vzvvy4I3o4Kldlm4dnsyvIy71PomI9ZOEOsYrbJkwhx1zhKLY1GunKiWGpm3G
 NlyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXugmQ+II+Av8BljRRkghAstRpriCTHCA7ofz5TYeQw+y6BhQnt2QSW4gBydRi6pm50Aq6b6OHQDk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkqsUHDxdLfqdWzsPRa7gLhH7fZ5bwr8qzFCnw8KOiqXb8wAP4
 ZHa8W8guPQV57PLmiNT9I+bG8SFt48fZ9SS2Y4uKzLp9dfF8uLjXdWasCeZcfw==
X-Gm-Gg: ASbGncsjtyWhdvYpU/ZPs/YLy5fMeuR6OK34b4foxa8XwwDJ+tb+h3W5GTIvNKSoxGd
 mSs/BZhc25PXaD/F/TR7KVEhrYj+G2A7XS2+1iyM0Tsbp/+yf0MS518xiUEU/su9SjACaVUZvuJ
 PQJ4ZtVCkzsMblKfGJDW3jW/DQLftLLE81vZayp3iXgn+Qh1U8fze7nTMdAtCgBpZB8JNgPFp1/
 ohumMrNAziKnEhh1wOsPIu2q13HqQRyV9TyF9NvThjwi7+l5Aqs36dkh5dpDIZQl3NKB4ZLLCx/
 6ypy1/zMvYIl
X-Google-Smtp-Source: AGHT+IEI5ovyp1RCIv/DEgpLwXFNydHyjD9DBddbq5V/1dJpcQ7kJme1DtYiR17VJHUI0rTtCpgyHQ==
X-Received: by 2002:a7b:ca4d:0:b0:434:9ff3:8ffc with SMTP id
 5b1f17b1804b1-434d4aaada7mr918595e9.4.1733307248895; 
 Wed, 04 Dec 2024 02:14:08 -0800 (PST)
Received: from google.com (158.100.79.34.bc.googleusercontent.com.
 [34.79.100.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e4617a61sm12383645f8f.3.2024.12.04.02.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 02:14:08 -0800 (PST)
Date: Wed, 4 Dec 2024 10:14:04 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 2/4] iommu/io-pgtable-arm: Re-use the pgtable walk
 for iova_to_phys
Message-ID: <Z1ArbJbqAnD-Qn52@google.com>
References: <20241028213146.238941-1-robdclark@gmail.com>
 <20241028213146.238941-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028213146.238941-3-robdclark@gmail.com>
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

Hi Rob,

On Mon, Oct 28, 2024 at 02:31:38PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Re-use the generic pgtable walk path.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/io-pgtable-arm.c | 74 +++++++++++++++++-----------------
>  1 file changed, 37 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 7e9c0f8ae138..88b128c77893 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -712,42 +712,6 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
>  				data->start_level, ptep);
>  }
>  
> -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> -					 unsigned long iova)
> -{
> -	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> -	arm_lpae_iopte pte, *ptep = data->pgd;
> -	int lvl = data->start_level;
> -
> -	do {
> -		/* Valid IOPTE pointer? */
> -		if (!ptep)
> -			return 0;
> -
> -		/* Grab the IOPTE we're interested in */
> -		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
> -		pte = READ_ONCE(*ptep);
> -
> -		/* Valid entry? */
> -		if (!pte)
> -			return 0;
> -
> -		/* Leaf entry? */
> -		if (iopte_leaf(pte, lvl, data->iop.fmt))
> -			goto found_translation;
> -
> -		/* Take it to the next level */
> -		ptep = iopte_deref(pte, data);
> -	} while (++lvl < ARM_LPAE_MAX_LEVELS);
> -
> -	/* Ran out of page tables to walk */
> -	return 0;
> -
> -found_translation:
> -	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
> -	return iopte_to_paddr(pte, data) | iova;
> -}
> -
>  struct io_pgtable_walk_data {
>  	struct io_pgtable		*iop;
>  	void				*data;
> @@ -763,6 +727,41 @@ static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
>  				 arm_lpae_iopte *ptep,
>  				 int lvl);
>  
> +struct iova_to_phys_data {
> +	arm_lpae_iopte pte;
> +	int lvl;
> +};
> +
> +static int visit_iova_to_phys(struct io_pgtable_walk_data *walk_data, int lvl,
> +			      arm_lpae_iopte *ptep, size_t size)
> +{
> +	struct iova_to_phys_data *data = walk_data->data;
> +	data->pte = *ptep;
> +	data->lvl = lvl;
> +	return 0;
> +}
> +
> +static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> +					 unsigned long iova)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	struct iova_to_phys_data d;
> +	struct io_pgtable_walk_data walk_data = {
> +		.data = &d,
> +		.visit = visit_iova_to_phys,
> +		.addr = iova,
> +		.end = iova + 1,
> +	};
> +	int ret;
> +
> +	ret = __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
> +	if (ret)
> +		return 0;
> +
> +	iova &= (ARM_LPAE_BLOCK_SIZE(d.lvl, data) - 1);
> +	return iopte_to_paddr(d.pte, data) | iova;
> +}
> +
>  static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
>  			    struct io_pgtable_walk_data *walk_data,
>  			    arm_lpae_iopte *ptep, int lvl)
> @@ -780,8 +779,9 @@ static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
>  		return 0;
>  	}
>  
> -	if (WARN_ON(!iopte_table(pte, lvl)))
> +	if (!iopte_table(pte, lvl)) {
>  		return -EINVAL;
> +	}
>  
>  	ptep = iopte_deref(pte, data);
>  	return __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
> -- 
> 2.47.0
> 
