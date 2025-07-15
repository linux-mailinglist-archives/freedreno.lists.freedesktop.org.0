Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8E4B0698E
	for <lists+freedreno@lfdr.de>; Wed, 16 Jul 2025 00:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F8F10E6E0;
	Tue, 15 Jul 2025 22:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WOA+EWPm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985AB10E715
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 22:59:25 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-613c7b65039so828753eaf.0
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 15:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752620365; x=1753225165; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nAbN1phbWnHR6tinlmWhEsvw3/nZ2WfWNMcro9Jd5Oo=;
 b=WOA+EWPmwmAnzr7gJDu+EbmLia+y6qOHj6bP4mckSB1ffWvkaVTcJJfz5dq0uipxvB
 cG1aSC/nR6xBifRqyRrUbOkIu2/yDwN20M2HibESnBt0R93qgJoKf50rcytfWZzpK2kK
 68tVaCJHhKSwX9Hk1vP5Wvk0hCxqZyN/2ivjH61c4gZz/zI09BgM4jrPiZtEXMPJTZND
 Qbza08RlL4ogQsu1QI/j0ojhRm2lnS/QoYQovMl7l6BXG2lXGqSGq9sVw1bCnvBLOPra
 FOhVYp1vaWIXM87ISLn7wBSJcVIc2AM8Ctjnhu+hOXL2QgX0cPzhxv34st6Ctp8JdcZy
 T35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752620365; x=1753225165;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nAbN1phbWnHR6tinlmWhEsvw3/nZ2WfWNMcro9Jd5Oo=;
 b=F6oXBepNTq0Z3oSEH24N+moGc8Y7aB3SKvFjVrqJx/CRLpxH1gl3Z7WFhglTxAd3ZB
 4qk4VsXxoDBjHgqKlNB0Mev6cpcyOHKD2+o955Jef5+EO2fmLe1dzWAl3infrQ1xzK0W
 DvdzF3rbYAkwZcKHql/4YqOTZuK2zLwcl/vFRtKjl0F9hyOF+vWl3kDVjxdhZuwoJZ57
 S6w/qbQac4gBh8Bn9BSqibO0znXKIGGSrT5oeBaAdZ4PdUFMEFZWGfl5O64rdk7LRd4P
 z8aejtsFRH4vfE+J1cOyCavgM4tzskNBWaPft4V5KpPEYb8uk9H96XS7ytflOZZa8dAd
 SXsg==
X-Gm-Message-State: AOJu0YwwhRLj2u7kDPIJT45xFEw7wasOMBkwwH46HHC15ZvbkaFtv+/L
 NX13KtfILRFZ/TYTn3qs51N4qTg+nR1yuGGAcgE1Z8y16mlaOUYrhoxlHAKYPn/Nt2c=
X-Gm-Gg: ASbGnctoEjYC8i3x8t0HtOmOVlAKIwycMmRixyf+1QBJhcnOqyNg8tBg+PNFolTLZSF
 OjSYkET+f5hr3NeYIUHxjy4qx/kETRD/IDYR/k5Hu3cS46EACmM9MuFQSOtd0KpgOYQ4pXjT9F1
 dBVThgcQ69+aQdhJUCur+YK1bcOE3fP9+eu3IT6d0Od2Hq6OOQ8zkHYB1ObkA1+QwAI7/medMp5
 mvzCzgrEK8VvdC+Y9jUZoAGYHvSScNFNBfL8qBx1ymtstd5TsYxRmSpQqJCApihDHHVpEvw7eSf
 jdsLtHOq6eFSQc9mdQlsnzGPg/Hlq0hC7aCHtDhmo1HyfrHJy1Iy5WZaQWx2ynQQslgSwW+5PQK
 QHXu9Y+nfOFDvwBJaYT1bZywg6/aX
X-Google-Smtp-Source: AGHT+IG0wy7DyTehUAZCiFKNekxjgta2wc39ptqLXGwqA7ffyUNnEWamWaLTQpcfhbS6l8BCDfP8jg==
X-Received: by 2002:a05:6808:244f:b0:406:5a47:a081 with SMTP id
 5614622812f47-41d034ec1f2mr472800b6e.13.1752620364673; 
 Tue, 15 Jul 2025 15:59:24 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
 by smtp.gmail.com with UTF8SMTPSA id
 5614622812f47-41c48678a3esm496352b6e.26.2025.07.15.15.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 15:59:24 -0700 (PDT)
Date: Tue, 15 Jul 2025 17:59:23 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: freedreno@lists.freedesktop.org
Subject: [bug report] drm/msm: Support pgtable preallocation
Message-ID: <cf1dacd6-3e09-4ec1-aaea-a28ac3105e07@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Rob Clark,

Commit e601ea31d66b ("drm/msm: Support pgtable preallocation") from
Jun 29, 2025 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/msm/msm_iommu.c:782 msm_iommu_gpu_new()
	error: we previously assumed 'adreno_smmu' could be null (see line 771)

drivers/gpu/drm/msm/msm_iommu.c
    760 struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks)
    761 {
    762         struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(dev);
    763         struct msm_iommu *iommu;
    764         struct msm_mmu *mmu;
    765 
    766         mmu = msm_iommu_new(dev, quirks);
    767         if (IS_ERR_OR_NULL(mmu))
    768                 return mmu;
    769 
    770         iommu = to_msm_iommu(mmu);
    771         if (adreno_smmu && adreno_smmu->cookie) {
                    ^^^^^^^^^^^
The commit adds a NULL check.  Hopefully it can be removed.

    772                 const struct io_pgtable_cfg *cfg =
    773                         adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
    774                 size_t tblsz = get_tblsz(cfg);
    775 
    776                 iommu->pt_cache =
    777                         kmem_cache_create("msm-mmu-pt", tblsz, tblsz, 0, NULL);
    778         }
    779         iommu_set_fault_handler(iommu->domain, msm_gpu_fault_handler, iommu);
    780 
    781         /* Enable stall on iommu fault: */
--> 782         if (adreno_smmu->set_stall)
                    ^^^^^^^^^^^
because the old code dereferences "adreno_smmu" without checking.

    783                 adreno_smmu->set_stall(adreno_smmu->cookie, true);
    784 
    785         return mmu;
    786 }

regards,
dan carpenter
