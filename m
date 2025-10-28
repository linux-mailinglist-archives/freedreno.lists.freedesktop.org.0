Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22572C131FF
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 07:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB83810E055;
	Tue, 28 Oct 2025 06:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V4qJFehr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA1910E590
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 06:24:29 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7a2852819a8so3826990b3a.3
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 23:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761632669; x=1762237469; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xdmp4Me7wQgWGSINcaaO6DB12X776uykd1AanqKsIrg=;
 b=V4qJFehr1PrGDxH8p8HE48UBi2HjA9QXNTsOKO91VO01Te9UDJJcAdSFPGIm1vU+Od
 S65dqmK2Fa0qKm2mzHcY95YV7CWaeUU8sIvzyt648eUHpSaT+kDn4UXJqUsyxgTKD1F1
 9djl3/Ftf4ujx0Tbex8Q1WVp16Z6XuCa+d5aTm2uikMETY0wIJmrBMwdD6g8yZaLBzbl
 i5tQKHjq38xo/VN4avygPr89uBRZwekarVCO2ooAwXOAf8+Y32k2or7TI/f4bBJ7Mzf6
 nnsPS+2DtbWGWyqYsmsUOLukigRyJW3F1HZl+6IO43JOut8qDEyWyrpBD7VUQ4mkDp1M
 0P3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761632669; x=1762237469;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xdmp4Me7wQgWGSINcaaO6DB12X776uykd1AanqKsIrg=;
 b=ZNzDWsm7OW+sxIQ2XgtwcUfnM+j4xwsChfsBkLJoZ4k5ZxHCk7OgVNid9XPuN4C8I2
 GwSQObPPcTL2aIKwRECbfJsmMXtaUBlTqx0pyhyPDyCs56z0Hn+G4pF7ss/ttd8gnLyD
 QDAfgFKJdzq9mwat8uk98mNZ/v3koruqRyFzE8+YPXUjAX04cefevXLUUzQjvtHEYVbG
 Jzj1ex2w5CaZVg1D3waE6LTr8hE9Tk0mptetChNyMPBvlaK664Nr/tMiBDudkyqQxw0h
 omrKEMPQzHCa72VSiSDPJo4UgcPQxLON9gOsLgt7vP6NOtyQtc53om11xZO8umyZ1mj+
 wWsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMUh6pDR6RjM9qlxHxdM1m4XpdXnDofdWiyMtfIFledL41TPrvqmYiyKz4/wQjEYzBU1Tnj+DCYlg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJ+Ahoflq+q8mDqb1yJzUe417IrOMBGJLN+L1I9dcbZMWt7hZZ
 qQLYOUeKb+8a433lbqweNRKZu6u20JiPGgG4Ey0mK1dZomZwNFb0Qi4Z
X-Gm-Gg: ASbGncstsXliNiTUoGaZpWBiAGVoU+TvbdcENwfIQg+HciWTyy6xv0coY2ozsJ3VBjW
 0Acf2UUaJjO0O8IUm9apP5XSxyGx3TVkkLPiHunVjVggOOK7YPbqaMmiWnyBjyFD+uxOWJU/qHk
 VkWsvWPRlbg6/7e/nPgqtJcA8L5ih0uE3Cn147o26mkMIbMC8oiPo3pRuinN8FCUBBmWI20eOsJ
 fb5TglJHVbaHgaCRhlati56XYmppmzeDfkY3X0yhd2e3+Be004v7g/pLsYRR5vHzWtnpDZyf3u1
 92Zv2FrR+u+7xx5IGZe9DJ1po9RYA407Skp51ZqNs4upJkHUUJsN2ewSbXm65ChreAL0jJiuPx0
 NQMSAYFHFbceFtMgpFS960+inxGrOytWGypMUtpmx5ZS+H2lyO0rPhVG3AWBiAUQMsERgT0s5lh
 OrVhlC+51D8VShMbD1n4ezRsTP5wMY0zIDf2PZxLLakYKEk9a1UkyBig==
X-Google-Smtp-Source: AGHT+IGv+D4wp24FT68CnJLR5oLyMpLV/E78aYjMLl1V6sgXD7UwHIdmxv8JaQ7oQ0PzT0e74dyMKQ==
X-Received: by 2002:a05:6a21:9989:b0:334:8239:56c9 with SMTP id
 adf61e73a8af0-344d3e45ee7mr3169929637.49.1761632668919; 
 Mon, 27 Oct 2025 23:24:28 -0700 (PDT)
Received: from ?IPV6:2600:8802:702:7400:1c69:7897:d90:375b?
 ([2600:8802:702:7400:1c69:7897:d90:375b])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b7128e41a2esm9174084a12.22.2025.10.27.23.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 23:24:28 -0700 (PDT)
Message-ID: <49308ca0-ebd1-4915-9ef4-0a5e31793da4@gmail.com>
Date: Mon, 27 Oct 2025 23:24:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jesszhan0024@gmail.com>
In-Reply-To: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 10/27/2025 6:35 AM, Dmitry Baryshkov wrote:
> The commit a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for
> HW blocks") dropped all dpu_hw_foo_destroy() functions, but the
> prototype for dpu_hw_dsc_destroy() was omitted. Drop it now to clean up
> the header.
> 
> Fixes: a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for HW blocks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jesszhan0024@gmail.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> index b7013c9822d23238eb5411a5e284bb072ecc3395..cc7cc6f6f7cda639b30bad7632c6e73aacedfcb8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> @@ -71,12 +71,6 @@ struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
>   				       const struct dpu_dsc_cfg *cfg,
>   				       void __iomem *addr);
>   
> -/**
> - * dpu_hw_dsc_destroy - destroys dsc driver context
> - * @dsc:   Pointer to dsc driver context returned by dpu_hw_dsc_init
> - */
> -void dpu_hw_dsc_destroy(struct dpu_hw_dsc *dsc);
> -
>   static inline struct dpu_hw_dsc *to_dpu_hw_dsc(struct dpu_hw_blk *hw)
>   {
>   	return container_of(hw, struct dpu_hw_dsc, base);
> 
> ---
> base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
> change-id: 20251027-dpu-drop-dsc-destroy-a1265a9b8d99
> 
> Best regards,

