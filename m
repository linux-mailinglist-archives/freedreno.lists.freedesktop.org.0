Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B32F39E3744
	for <lists+freedreno@lfdr.de>; Wed,  4 Dec 2024 11:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A2810ECB6;
	Wed,  4 Dec 2024 10:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="fUpG8nnq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A0910ECB6
 for <freedreno@lists.freedesktop.org>; Wed,  4 Dec 2024 10:12:30 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4349c7b6b0dso35595e9.1
 for <freedreno@lists.freedesktop.org>; Wed, 04 Dec 2024 02:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733307149; x=1733911949;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qLs+MAjnlkioXfCJEobmWlFJttU5DMSqco9NCjVHPyc=;
 b=fUpG8nnqoCW24WGYbC1hh88wSp4mc3NYa+3OBb54WeX8EAZQ54p2xsZoJGAv6KwJV+
 kxreq/UiQrChAXtSESV2xtPZrqAXcVfkKBBjp93cPM5FAOtFfRMFC5tUrrCGyOMoXqk5
 Tx53rMkh+YCqA7ZJwYHxhtlAdCg4pn7u9EYHBMtEqfJSHv6n6rmbnwIgN+2GUoT0XXHS
 gyH78LIwrYclRGB0wWyJXIGAC3UzsodUKARVzcQt0GYBpX558cfQ0SZWP6beSKe5G2vu
 hKMB/2WxpCT2GbauteP58bo44DzZkIkMuBZTk0U8hV7krQ6wXo0dPcUJDpHjAjQhM2JJ
 FIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733307149; x=1733911949;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qLs+MAjnlkioXfCJEobmWlFJttU5DMSqco9NCjVHPyc=;
 b=A2mSyGHgA1+JumwpsFv4MHhg4IYeWe+ny8zVFn1R6n01qM1rOw0utW7opw16Cqdw96
 cb/HTk2MW0QIlKTyUTGZpJRumfaFxof40GTV4AVv9GdRNn3s/k/R9Ic3ejWI8xL8UxfB
 BbnEAXLw1syWcAXpMDX33b/MhExPQz8nNs53sB+1fCpapd1zWxz3RD+qOnYfJholB50A
 cvFOn0b/Y3hSKzbIU32ZgzPlmpV6hJcwIpqnI8ep8phH/vTuZF7gxytoZENQ+ptyMWI5
 VGI9NdfcPu/Mc9qPFyj5xI6e86z1nn56ZUevq37NJa3tNMpjLwemv8EZyJnfQqIlsUcm
 oFeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHTVBvx/CPoHrOWmAT+v+DateTzgtxjxLm5esk+pScgHD/31Q4KHXC0BaxKJT+q41+t1JJb6cJB84=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjXt8nRdedef3LF3owxD3IB6J/8vqm4ZPVAx77VJMxo0V2nWHZ
 Za1wpBqMp74xpLe9fKw5fVpRWozJqgLFEgS/x/kWEG1u7rtCT9WP64hRwYfHrg==
X-Gm-Gg: ASbGncuXgTJHS7svEb80ejIhJQZkDixxmNR11y8YesAtZuR+whwEk2LYiokSs6LnXia
 ZnRn3qQFDPjRTv7zDljPa869Nmv8KqUh0iEJSorXEHG/QSVyxiOlKOGc64Yk5Mk3T8skFBSBmmw
 pvmk4U4N6g6k7dHP3iVgvNPevPzBy/Sgnsq58xx/xAqGZ5iXiViNglJZaFM61Cj5oDtRbYGIg0h
 eEPo38xPCj/r3SHn5uQoPrYzObeDppfA88X9G3dhqaTDDDAr2UvPpYv2dg1xYLph1xYwVT8Ttfc
 FC+2vOWejrV1
X-Google-Smtp-Source: AGHT+IF9rW/W/KKMO9BVSr/bLw+TLa/dGxJXo2KOIrSL7bT2KMLiMDQYkoQTQpYdu8So3eWOjlcV+w==
X-Received: by 2002:a05:600c:4a93:b0:42c:acd7:b59b with SMTP id
 5b1f17b1804b1-434d4aab051mr1048795e9.6.1733307148736; 
 Wed, 04 Dec 2024 02:12:28 -0800 (PST)
Received: from google.com (158.100.79.34.bc.googleusercontent.com.
 [34.79.100.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385eeb999f4sm9494986f8f.109.2024.12.04.02.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 02:12:28 -0800 (PST)
Date: Wed, 4 Dec 2024 10:12:24 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 1/4] iommu/io-pgtable-arm: Make pgtable walker more
 generic
Message-ID: <Z1ArCCTGtJY9gxP3@google.com>
References: <20241028213146.238941-1-robdclark@gmail.com>
 <20241028213146.238941-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028213146.238941-2-robdclark@gmail.com>
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

On Mon, Oct 28, 2024 at 02:31:37PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We can re-use this basic pgtable walk logic in a few places.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Mostafa Saleh <smostafa@google.com>

> ---
>  drivers/iommu/io-pgtable-arm.c | 67 ++++++++++++++++++++++------------
>  1 file changed, 43 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 0e67f1721a3d..7e9c0f8ae138 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -749,33 +749,33 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
>  }
>  
>  struct io_pgtable_walk_data {
> -	struct iommu_dirty_bitmap	*dirty;
> +	struct io_pgtable		*iop;
> +	void				*data;
> +	int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
> +		     arm_lpae_iopte *ptep, size_t size);
>  	unsigned long			flags;
>  	u64				addr;
>  	const u64			end;
>  };
>  
> -static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
> -				       struct io_pgtable_walk_data *walk_data,
> -				       arm_lpae_iopte *ptep,
> -				       int lvl);
> +static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
> +				 struct io_pgtable_walk_data *walk_data,
> +				 arm_lpae_iopte *ptep,
> +				 int lvl);
>  
> -static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
> -				  struct io_pgtable_walk_data *walk_data,
> -				  arm_lpae_iopte *ptep, int lvl)
> +static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
> +			    struct io_pgtable_walk_data *walk_data,
> +			    arm_lpae_iopte *ptep, int lvl)
>  {
>  	struct io_pgtable *iop = &data->iop;
>  	arm_lpae_iopte pte = READ_ONCE(*ptep);
>  
> -	if (iopte_leaf(pte, lvl, iop->fmt)) {
> -		size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
> +	size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
> +	int ret = walk_data->visit(walk_data, lvl, ptep, size);
> +	if (ret)
> +		return ret;
>  
> -		if (iopte_writeable_dirty(pte)) {
> -			iommu_dirty_bitmap_record(walk_data->dirty,
> -						  walk_data->addr, size);
> -			if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
> -				iopte_set_writeable_clean(ptep);
> -		}
> +	if (iopte_leaf(pte, lvl, iop->fmt)) {
>  		walk_data->addr += size;
>  		return 0;
>  	}
> @@ -784,13 +784,13 @@ static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
>  		return -EINVAL;
>  
>  	ptep = iopte_deref(pte, data);
> -	return __arm_lpae_iopte_walk_dirty(data, walk_data, ptep, lvl + 1);
> +	return __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
>  }
>  
> -static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
> -				       struct io_pgtable_walk_data *walk_data,
> -				       arm_lpae_iopte *ptep,
> -				       int lvl)
> +static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
> +				 struct io_pgtable_walk_data *walk_data,
> +				 arm_lpae_iopte *ptep,
> +				 int lvl)
>  {
>  	u32 idx;
>  	int max_entries, ret;
> @@ -805,7 +805,7 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
>  
>  	for (idx = ARM_LPAE_LVL_IDX(walk_data->addr, lvl, data);
>  	     (idx < max_entries) && (walk_data->addr < walk_data->end); ++idx) {
> -		ret = io_pgtable_visit_dirty(data, walk_data, ptep + idx, lvl);
> +		ret = io_pgtable_visit(data, walk_data, ptep + idx, lvl);
>  		if (ret)
>  			return ret;
>  	}
> @@ -813,6 +813,23 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
>  	return 0;
>  }
>  
> +static int visit_dirty(struct io_pgtable_walk_data *walk_data, int lvl,
> +		       arm_lpae_iopte *ptep, size_t size)
> +{
> +	struct iommu_dirty_bitmap *dirty = walk_data->data;
> +
> +	if (!iopte_leaf(*ptep, lvl, walk_data->iop->fmt))
> +		return 0;
> +
> +	if (iopte_writeable_dirty(*ptep)) {
> +		iommu_dirty_bitmap_record(dirty, walk_data->addr, size);
> +		if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
> +			iopte_set_writeable_clean(ptep);
> +	}
> +
> +	return 0;
> +}
> +
>  static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
>  					 unsigned long iova, size_t size,
>  					 unsigned long flags,
> @@ -821,7 +838,9 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
>  	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
>  	struct io_pgtable_cfg *cfg = &data->iop.cfg;
>  	struct io_pgtable_walk_data walk_data = {
> -		.dirty = dirty,
> +		.iop = &data->iop,
> +		.data = dirty,
> +		.visit = visit_dirty,
>  		.flags = flags,
>  		.addr = iova,
>  		.end = iova + size,
> @@ -836,7 +855,7 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
>  	if (data->iop.fmt != ARM_64_LPAE_S1)
>  		return -EINVAL;
>  
> -	return __arm_lpae_iopte_walk_dirty(data, &walk_data, ptep, lvl);
> +	return __arm_lpae_iopte_walk(data, &walk_data, ptep, lvl);
>  }
>  
>  static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
> -- 
> 2.47.0
> 
