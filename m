Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7F09E375E
	for <lists+freedreno@lfdr.de>; Wed,  4 Dec 2024 11:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7029310E2A4;
	Wed,  4 Dec 2024 10:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="nN3QwMHS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B13510E2A4
 for <freedreno@lists.freedesktop.org>; Wed,  4 Dec 2024 10:21:08 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4349c7b6b0dso36325e9.1
 for <freedreno@lists.freedesktop.org>; Wed, 04 Dec 2024 02:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733307667; x=1733912467;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CkYLTBgm995LkjvCxemjC6Jocdx1o/Bh1C0vkU2Fy7M=;
 b=nN3QwMHSk1nQIPOqwB9LasVcVY22ErYUFKJbIrs+OYQxzmuUyuRsekWNI6BP+IkAv1
 3TnyYwPrtgMSBrMAEaQkJ6ZRaGgkGWm19U2sigCkhZK9t9fnudlP9YTkvhQUezRuBMHo
 Hp+PkCCWpAL0xBCa6EFdkeLFj7jOL8xeog9ejiR4MmwHd6TIto8tx64eONys6/QQfTjY
 MnU6fdaw1xy1uT1v3PGO21REDz3VOpg8AyCXuA1olq52jRqammgR/UctuvslMWk5YX5W
 kfMMIDuSgzGnRqXr0jW0m5QrWORSQEhoMZQIir/DvfQh9WG+XCrKYJlGuWHZG4IrIMNB
 Oq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733307667; x=1733912467;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CkYLTBgm995LkjvCxemjC6Jocdx1o/Bh1C0vkU2Fy7M=;
 b=GWgKjRvnVokYsRh3eZH250jq6G5vzzx5YGXTrgIq+17EPQSblzS1w9Jz09KqFam1hp
 QwgoRfmtP/hCaZhWKu8jnde9DqqYLgAmTH/B5rLXs1vcF/sb1ESNycCw0pEf7q80SQhv
 l+QmxIcFq1TsX5zMoDH7tD/UpXeZsEX/8sCiPNAybDpffwhXPvySHEWhdZRG92xyvr9T
 rfe5Eglc1ic+JFfelxbo7qe0uVG49ksiYr7h6StRnKTBK2831QmHsF5d6O3x0kCrOrh3
 ROz7BGtbAF7LLWNFT1cvy7TuE19VIVu1wHItayalF7B1e47/NDdTMvsngSNBlFTNOWnE
 Q53Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdKOBywzFUfrgXbJePozE18x/lMzCkYJ6T2XXKln9tXhsr0K/1dV9UnC7ejPO3c3cnsXtG3cypAGU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiG9AvoygB1EVBW/POHu23ur4/xrsR500j57dDogXYOHg7TJwg
 AN8DHKo5pgySuhcWJaxkOyYtgxZDg5Ui82UVBT+L0IBSnyjaZMocFvNs2C6WoQ==
X-Gm-Gg: ASbGncs7rw4hCN9N6yf2ZblSqVIKZ9hivwTy/P+J51PwHn47fb318MVIAem/hzNRFhi
 1H2QJd2plYE10xoMDsLUTKM9hXHjK7DcaNBNCdocfNoR7FSCZUs2CZsI6yyE1yYHOhkXyWE1tKt
 woKSVgfYjBt1gZ8S0Ol2VSjHEnRU2tlbyIm0kEeuTpBLa7gYTO2uFLGZfKLLxtoC9W20rdv0bYN
 QPil9H4M1kfl1E0AjJpYNK6UyK4tBHIZIO9Ci5B2r74ExmBfL5YzQxFDPb2mTYqfTmaU8mUsaL5
 /w5tru5vKUZh
X-Google-Smtp-Source: AGHT+IE7T8d7TZw5PeKMBFpYLBTez7iD+72RMF2IGZ5bXAf6OdVX2raWOJrJNuhpXSW4NzSb1otqdQ==
X-Received: by 2002:a05:600c:5113:b0:431:43a1:4cac with SMTP id
 5b1f17b1804b1-434d528f647mr784575e9.3.1733307666792; 
 Wed, 04 Dec 2024 02:21:06 -0800 (PST)
Received: from google.com (158.100.79.34.bc.googleusercontent.com.
 [34.79.100.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52cb6e1sm19021945e9.37.2024.12.04.02.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 02:21:06 -0800 (PST)
Date: Wed, 4 Dec 2024 10:21:02 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vasant Hegde <vasant.hegde@amd.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 3/4] iommu/io-pgtable-arm: Add way to debug pgtable
 walk
Message-ID: <Z1AtDgLD0SDUxDHl@google.com>
References: <20241028213146.238941-1-robdclark@gmail.com>
 <20241028213146.238941-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028213146.238941-4-robdclark@gmail.com>
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

On Mon, Oct 28, 2024 at 02:31:39PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add an io-pgtable method to walk the pgtable returning the raw PTEs that
> would be traversed for a given iova access.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/io-pgtable-arm.c | 25 +++++++++++++++++++++++++
>  include/linux/io-pgtable.h     | 15 +++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 88b128c77893..6739e1fa54ec 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -762,6 +762,30 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
>  	return iopte_to_paddr(d.pte, data) | iova;
>  }
>  
> +static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
> +			      arm_lpae_iopte *ptep, size_t size)
> +{
> +	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
> +	data->ptes[data->level++] = *ptep;
> +	return 0;
> +}
> +
> +static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
> +				 void *wd)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	struct io_pgtable_walk_data walk_data = {
> +		.data = wd,
> +		.visit = visit_pgtable_walk,
> +		.addr = iova,
> +		.end = iova + 1,
> +	};
> +
> +	((struct arm_lpae_io_pgtable_walk_data *)wd)->level = 0;

I think this is a bit fragile, as it only works because the walk spans
one address, otherwise it breaks, the visitor will keep incrementing
the level. IMO, this should be removed, and the visitor already knows
the level as it's passed as an argument, so something like this:

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 6739e1fa54ec..bc73f9edae8a 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -766,7 +766,8 @@ static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
 			      arm_lpae_iopte *ptep, size_t size)
 {
 	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
-	data->ptes[data->level++] = *ptep;
+	data->ptes[lvl] = *ptep;
+	data->level = lvl + 1;
 	return 0;
 }
 
@@ -781,8 +782,6 @@ static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
 		.end = iova + 1,
 	};
 
-	((struct arm_lpae_io_pgtable_walk_data *)wd)->level = 0;
-
 	return __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
 }
 
Thanks,
Mostafa
> +
> +	return __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
> +}
> +
>  static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
>  			    struct io_pgtable_walk_data *walk_data,
>  			    arm_lpae_iopte *ptep, int lvl)
> @@ -937,6 +961,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
>  		.unmap_pages	= arm_lpae_unmap_pages,
>  		.iova_to_phys	= arm_lpae_iova_to_phys,
>  		.read_and_clear_dirty = arm_lpae_read_and_clear_dirty,
> +		.pgtable_walk	= arm_lpae_pgtable_walk,
>  	};
>  
>  	return data;
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index b1ecfc3cd5bc..d7bfbf351975 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -178,12 +178,26 @@ struct io_pgtable_cfg {
>  	};
>  };
>  
> +/**
> + * struct arm_lpae_io_pgtable_walk_data - information from a pgtable walk
> + *
> + * @ptes:     The recorded PTE values from the walk
> + * @level:    The level of the last PTE
> + *
> + * @level also specifies the last valid index in @ptes
> + */
> +struct arm_lpae_io_pgtable_walk_data {
> +	u64 ptes[4];
> +	int level;
> +};
> +
>  /**
>   * struct io_pgtable_ops - Page table manipulation API for IOMMU drivers.
>   *
>   * @map_pages:    Map a physically contiguous range of pages of the same size.
>   * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
>   * @iova_to_phys: Translate iova to physical address.
> + * @pgtable_walk: (optional) Perform a page table walk for a given iova.
>   *
>   * These functions map directly onto the iommu_ops member functions with
>   * the same names.
> @@ -197,6 +211,7 @@ struct io_pgtable_ops {
>  			      struct iommu_iotlb_gather *gather);
>  	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
>  				    unsigned long iova);
> +	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova, void *wd);
>  	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
>  				    unsigned long iova, size_t size,
>  				    unsigned long flags,
> -- 
> 2.47.0
> 
