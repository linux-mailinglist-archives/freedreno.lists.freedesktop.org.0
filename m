Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A450A6F03D8
	for <lists+freedreno@lfdr.de>; Thu, 27 Apr 2023 11:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F3D10E122;
	Thu, 27 Apr 2023 09:59:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B5810E33E
 for <freedreno@lists.freedesktop.org>; Thu, 27 Apr 2023 09:59:31 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-94f59fbe2cbso240940466b.1
 for <freedreno@lists.freedesktop.org>; Thu, 27 Apr 2023 02:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1682589569; x=1685181569;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8NquWHEFbJKZX2gbSm4Ehemad7T4ozQG/E/WvhxNob8=;
 b=XlLSkFPoXIiTsYTEuukgAkA+JWv9B9jsb3SEnA4LsIHV62THau9IkIKsB5MaB1EdVx
 QVoQOLTQQNTMLIk2wWgNyPYvRAA0FeGSxpOVDo8J/rkz2s6sHaIrIEPKWDipRtDlmN2V
 YTRkofG3cWrv2uK1De8el4VUG+cmoMuOc8feQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682589569; x=1685181569;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8NquWHEFbJKZX2gbSm4Ehemad7T4ozQG/E/WvhxNob8=;
 b=HVQ7gn6ufn+mc4t/gYp6xqG3XY2D0oDMxWNPsf0mpN1HpYxwrFPjzWQ7bCCmWMK3pu
 sGo5dAlsBhf7VpLAhm9rqCPzNbSdsiL4CtKyVM/fAvaV5MwjYA55O3w1y2hPkazsB5Tt
 H2JZLTACmzBVM9IvYde6gC3ZmjASn4ICDK9eJzkB+xKrxI/BDDcAiTJ6zRx9XPyRPhHY
 6fqUv8rH8rdMgeMV2FQiF2LbrUVMRSyBpSE1U8jIH/hdpqyXRBGMLqh+i45s5z6TlLh3
 ZzZD63HoaU3E/vRfVE9u2FbKHj4RBxQKMCCrRLm8mF66M8I4wj5/13lSWqtBPlAqKqNe
 eL3A==
X-Gm-Message-State: AC+VfDwxOlqc7Tg13eRwb7foezdkKrhMGlqhzPqPLEhFijD5UXAFUecS
 LJAVo9h5ElIEPTiCpsbAFxNylA==
X-Google-Smtp-Source: ACHHUZ4d1BKrQgAKmkNUl21rH106gG/B6sW+h7EYIFJ7ogoatFxrlwGLtuzu6/dr99r5TFK0aVvnqA==
X-Received: by 2002:a17:906:64c4:b0:94f:4ec3:f0f5 with SMTP id
 p4-20020a17090664c400b0094f4ec3f0f5mr1012683ejn.4.1682589569485; 
 Thu, 27 Apr 2023 02:59:29 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 n25-20020a1709062bd900b0094fa472a7c4sm9456005ejg.161.2023.04.27.02.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 02:59:29 -0700 (PDT)
Date: Thu, 27 Apr 2023 11:59:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mark Yacoub <markyacoub@chromium.org>
Message-ID: <ZEpHfxw5IhzGFStV@phenom.ffwll.local>
Mail-Followup-To: Mark Yacoub <markyacoub@chromium.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, seanpaul@chromium.org,
 dianders@chromium.org, dmitry.baryshkov@linaro.org,
 linux-kernel@vger.kernel.org
References: <20230421162749.360777-1-markyacoub@google.com>
 <20230421162749.360777-2-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421162749.360777-2-markyacoub@google.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
Subject: Re: [Freedreno] [PATCH v2 1/3] drm: Create support for Write-Only
 property blob
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
Cc: Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, dianders@chromium.org,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dmitry.baryshkov@linaro.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 12:27:47PM -0400, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@chromium.org>
> 
> [Why]
> User space might need to inject data into the kernel without allowing it
> to be read again by any user space.
> An example of where this is particularly useful is secret keys fetched
> by user space and injected into the kernel to enable content protection.
> 
> [How]
> Create a DRM_MODE_CREATE_BLOB_WRITE_ONLY flag used by user space to
> create a blob and mark the blob as write only.
> On reading back the blob, data will be not be copied if it's a write
> only blob

This makes no sense at all, why would you want to disallow reading?
Userspace already knows the key, there's not much point in hiding it from
userspace?

Also for new uapi we need the igt patches and userspace, please link
those.
-Daniel

> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/drm_property.c | 3 ++-
>  include/drm/drm_property.h     | 2 ++
>  include/uapi/drm/drm_mode.h    | 6 ++++++
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
> index dfec479830e49..afedf7109d002 100644
> --- a/drivers/gpu/drm/drm_property.c
> +++ b/drivers/gpu/drm/drm_property.c
> @@ -765,7 +765,7 @@ int drm_mode_getblob_ioctl(struct drm_device *dev,
>  	if (!blob)
>  		return -ENOENT;
>  
> -	if (out_resp->length == blob->length) {
> +	if (out_resp->length == blob->length && !blob->is_write_only) {
>  		if (copy_to_user(u64_to_user_ptr(out_resp->data),
>  				 blob->data,
>  				 blob->length)) {
> @@ -800,6 +800,7 @@ int drm_mode_createblob_ioctl(struct drm_device *dev,
>  		ret = -EFAULT;
>  		goto out_blob;
>  	}
> +	blob->is_write_only = out_resp->flags & DRM_MODE_CREATE_BLOB_WRITE_ONLY;
>  
>  	/* Dropping the lock between create_blob and our access here is safe
>  	 * as only the same file_priv can remove the blob; at this point, it is
> diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
> index 65bc9710a4702..700782f021b99 100644
> --- a/include/drm/drm_property.h
> +++ b/include/drm/drm_property.h
> @@ -205,6 +205,7 @@ struct drm_property {
>   * 	&drm_mode_config.property_blob_list.
>   * @head_file: entry on the per-file blob list in &drm_file.blobs list.
>   * @length: size of the blob in bytes, invariant over the lifetime of the object
> + * @is_write_only: user space can't read the blob data.
>   * @data: actual data, embedded at the end of this structure
>   *
>   * Blobs are used to store bigger values than what fits directly into the 64
> @@ -219,6 +220,7 @@ struct drm_property_blob {
>  	struct list_head head_global;
>  	struct list_head head_file;
>  	size_t length;
> +	bool is_write_only;
>  	void *data;
>  };
>  
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 46becedf5b2fc..10403c9a73082 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1168,6 +1168,9 @@ struct drm_format_modifier {
>  	__u64 modifier;
>  };
>  
> +#define DRM_MODE_CREATE_BLOB_WRITE_ONLY                                        \
> +	(1 << 0) /* data of the blob can't be read by user space */
> +
>  /**
>   * struct drm_mode_create_blob - Create New blob property
>   *
> @@ -1181,6 +1184,9 @@ struct drm_mode_create_blob {
>  	__u32 length;
>  	/** @blob_id: Return: new property ID. */
>  	__u32 blob_id;
> +	/** Flags for special handling. */
> +	__u32 flags;
> +	__u32 pad;
>  };
>  
>  /**
> -- 
> 2.40.0.634.g4ca3ef3211-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
