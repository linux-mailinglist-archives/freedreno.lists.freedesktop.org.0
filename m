Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE3BAD9C0B
	for <lists+freedreno@lfdr.de>; Sat, 14 Jun 2025 12:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D616310E032;
	Sat, 14 Jun 2025 10:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LgPvH0y0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2FF10E05D
 for <freedreno@lists.freedesktop.org>; Sat, 14 Jun 2025 10:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749896246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nWfzkp9DOQxWyynraH/ijyp0mDSRdle98rE+BwtdI/A=;
 b=LgPvH0y0LC9De8VQy/+T2CKF+QZQ6t74IbYQjYTiAclyWReSC3L3H9yBM9UkqnwdU4giRv
 iSktXyBIpW6eP8/dwt1WkbaN22ZU79xAnXbZyI+gGJSz+dZzLHxUZOn9cAFrLmk2qHFL0w
 0bs15uTqt8NMt8REW5s8fHO4u2JRIRM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-wegzAFdQN9uBLCw3qaFmig-1; Sat, 14 Jun 2025 06:17:25 -0400
X-MC-Unique: wegzAFdQN9uBLCw3qaFmig-1
X-Mimecast-MFC-AGG-ID: wegzAFdQN9uBLCw3qaFmig_1749896244
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a579058758so51688f8f.1
 for <freedreno@lists.freedesktop.org>; Sat, 14 Jun 2025 03:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749896244; x=1750501044;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWfzkp9DOQxWyynraH/ijyp0mDSRdle98rE+BwtdI/A=;
 b=Lp4BdcbTY+r3BzzTWaEtSyACsGyuZ+O4JlYo+MSoenVZz48x//kL+zZ+B+TmtvcGVP
 5q8TDNzGNi/fQME76OSRwcA7Co1qLvhNvaDN+glDUnVFFZYJGRD6ZC4SReipadgwdAKU
 iHILbSA0ZM5QPD4BPE+Kb5GLfMieGMo5FuZI4KpYrr0KEm3HM73EWpgC8Cq6JbQ7yhxp
 gR94+uCq7226YaxoQPkoa7VnfwTSkYDyX69vVqqqH84j1NwdjWE9UbunmjpmRbIpsQr2
 PyLuKcow+zuwBci/L/qLOHbiTwK9K+VXpXBKwdtwCY1XabFjHqGJyILvFxOb52rpC7lq
 wKkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1ahbDlJLSBIWxZi3X3zoj7gmcJmENN6WwPHLeBGi+XDPC0PslL7Ll1QbN+R/hrkoFSxsFuS1vKNU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8r9lN1o0w62QL10jq74nbSKB4HaDR+c6C7Zj78rjq7ZQfagih
 xoTAxFxCjyASmuy6zWcDNNrbn5xJ21WCDdsRhFsQNbD/XLQ0oa30WRfy6Q8PgsSdDnK+SiJuhdp
 53yztMIKkznRlTmTVUGr2/4/8j/j+7M19uIqL0lUvb0st4M2CcsaYnWP96ggB4rWXYe/Cnw==
X-Gm-Gg: ASbGnctix1M+BOJ1Y1fUZVn58uGtbMOuxpSKrIKuxbcA/wVFQiKRrmzt9K43Yj7WKX+
 m+msD2tBRhJK+MUsbC/91ASQFF5PVFudxyayzPMdnx9z19NAp6oNUnt0NfyHXdjGmMe4vIEl2Wc
 IeVfAYZXGzsofEQmnbftxNocNKWSbeaeQY4mUUHiDI5Qmp+tMy2QkjPX5djz8F996UiRmlCqXRA
 hA5vSoVnLlBdnFCeL5XhDWuPUnRPzpY4JX6W/Wcq+fB7Dm7fOJLJSK18RKL8fQ4yCqdp6RM3i2t
 irDCxYCSj9U=
X-Received: by 2002:a05:6000:1ac8:b0:3a5:2653:734d with SMTP id
 ffacd0b85a97d-3a572e7a1eemr2781694f8f.28.1749896244121; 
 Sat, 14 Jun 2025 03:17:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3biEpVOuRnqziHI3bd4pkeY+o+bBTVgVmJnrCTb1g1AU1PCZyfTJ+l+vhMsQAiXihkjOm6w==
X-Received: by 2002:a05:6000:1ac8:b0:3a5:2653:734d with SMTP id
 ffacd0b85a97d-3a572e7a1eemr2781679f8f.28.1749896243660; 
 Sat, 14 Jun 2025 03:17:23 -0700 (PDT)
Received: from pollux ([2a00:79c0:666:b300:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532dea1925sm80613655e9.12.2025.06.14.03.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jun 2025 03:17:22 -0700 (PDT)
Date: Sat, 14 Jun 2025 12:17:20 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/gpuvm: Fix doc comments
Message-ID: <aE1MMHrTNuCFW2ip@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-2-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20250613235705.28006-2-robin.clark@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cnwZ5M1-LUPYgUxRkbs_xrhAhySzhtorPTWcTOZzDds_1749896244
X-Mimecast-Originator: redhat.com
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

On Fri, Jun 13, 2025 at 04:57:02PM -0700, Rob Clark wrote:
> Correctly summerize drm_gpuvm_sm_map/unmap, and fix the parameter order
> and names.  Just something I noticed in passing.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 6 +++---
>  include/drm/drm_gpuvm.h     | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index f9eb56f24bef..0ca717130541 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2299,13 +2299,13 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>  }
>  
>  /**
> - * drm_gpuvm_sm_map() - creates the &drm_gpuva_op split/merge steps
> + * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
> + * @priv: pointer to a driver private data structure
>   * @req_addr: the start address of the new mapping
>   * @req_range: the range of the new mapping
>   * @req_obj: the &drm_gem_object to map
>   * @req_offset: the offset within the &drm_gem_object
> - * @priv: pointer to a driver private data structure
>   *
>   * This function iterates the given range of the GPU VA space. It utilizes the
>   * &drm_gpuvm_ops to call back into the driver providing the split and merge
> @@ -2349,7 +2349,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
>  
>  /**
> - * drm_gpuvm_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
> + * drm_gpuvm_sm_unmap() - calls the &drm_gpuva_ops to split on unmap
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
>   * @priv: pointer to a driver private data structure
>   * @req_addr: the start address of the range to unmap

Thanks for fixing this!

> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 2a9629377633..0ef837a331d6 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1205,11 +1205,11 @@ struct drm_gpuvm_ops {
>  };
>  
>  int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
> -		     u64 addr, u64 range,
> -		     struct drm_gem_object *obj, u64 offset);
> +		     u64 req_addr, u64 req_range,
> +		     struct drm_gem_object *req_obj, u64 req_offset);
>  
>  int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
> -		       u64 addr, u64 range);
> +		       u64 req_addr, u64 req_range);

Not sure we need to change the argument names though, I'd rather leave them as
they are.

Acked-by: Danilo Krummrich <dakr@kernel.org>

