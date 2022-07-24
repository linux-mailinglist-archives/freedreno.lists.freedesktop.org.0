Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CDF57F696
	for <lists+freedreno@lfdr.de>; Sun, 24 Jul 2022 20:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6830194A84;
	Sun, 24 Jul 2022 18:47:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFD1937B1
 for <freedreno@lists.freedesktop.org>; Sun, 24 Jul 2022 18:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658688464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xHhcfGRCAjt5E9OSivN130xjZgYbsf/HAXgqsJ2fhnE=;
 b=c+eFMsCNXftjo+73cgj9J7U4Sgb9Dn9BMuO0388Sxh82d9gSuYMcIQw/29t5/iGlYISpgo
 8ypZEvKXsCQHO6T8cb1JzPFF9EmuP/wktwyM/QlckciEKd4xOahyNQmFc9fcOyeMjlqQIW
 tXwOKDgPjBwhkBhu9XWImUM6CYtOZC4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-rW0ui_RLPvKlAmGNsnAwgw-1; Sun, 24 Jul 2022 14:47:43 -0400
X-MC-Unique: rW0ui_RLPvKlAmGNsnAwgw-1
Received: by mail-wm1-f71.google.com with SMTP id
 z20-20020a1c4c14000000b003a3020da654so3341309wmf.5
 for <freedreno@lists.freedesktop.org>; Sun, 24 Jul 2022 11:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xHhcfGRCAjt5E9OSivN130xjZgYbsf/HAXgqsJ2fhnE=;
 b=gKvHsPxuR7ZFZj7reIRLZLYoLrh/U0o1xp9fnZitX++HtFM04NTQTyECOSAI7MA9NU
 pg2ujF9nTL3B8Myatz8WNMLdF20VeehhFH37An5F//ODcq/yExXJ4ixNe85pLygHW8sI
 w8h++uGqzvx7nRKOyIMpKqbC1lwZNv+JB7h/39rmnoGZa7DIevtrvekubs4zKQisPN+O
 7n24uVkwYcttWcntZaKU/uN+XWs3tdq4wpyyi5w1pwxTa7LFqgAd0cE1/R6CuKmaVB87
 LMFjxWXwG6YTfMHgl98VobT+SKPJoMtWS/2NQFTmP491KsD98KWcRNt6EHwtTJ2VD63r
 0myg==
X-Gm-Message-State: AJIora9qoMK3pWIaVsBPs2hvg5DqWvVoy+L63QjjX+LRodnqaRP4z9d/
 QgkkgHPnF2u4imLNzznlxNax67k/gJ5gSxLOdGlKV5o/dG6Oxw6mCRv6FN6NaWnJno/xGvHBiKG
 gpRWv39zw0YaysyTQ5u7SoaRo+Qjm
X-Received: by 2002:a05:600c:284a:b0:3a2:ffb7:b56f with SMTP id
 r10-20020a05600c284a00b003a2ffb7b56fmr18986258wmb.134.1658688461905; 
 Sun, 24 Jul 2022 11:47:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v//byKmdQgT5WvEWcDFD958f9+TODdjybZDGMctnTVoovPF22h8szxUHlYNCu+EncFlDUATg==
X-Received: by 2002:a05:600c:284a:b0:3a2:ffb7:b56f with SMTP id
 r10-20020a05600c284a00b003a2ffb7b56fmr18986246wmb.134.1658688461720; 
 Sun, 24 Jul 2022 11:47:41 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c378800b003a2e7c13a3asm11441121wmr.42.2022.07.24.11.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 11:47:41 -0700 (PDT)
Message-ID: <6b3f98db-83bf-41cd-b23d-79b455a06ebd@redhat.com>
Date: Sun, 24 Jul 2022 20:47:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220724111327.1195693-1-javierm@redhat.com>
 <CAA8EJppEpPe4nfZ_kvNen6shSvgyUoL3adSQfhhCGCS2VmVZhQ@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAA8EJppEpPe4nfZ_kvNen6shSvgyUoL3adSQfhhCGCS2VmVZhQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm: Make .remove and .shutdown HW
 shutdown consistent
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hello Dmitry,

Thanks for your feedback.

On 7/24/22 20:36, Dmitry Baryshkov wrote:
> On Sun, 24 Jul 2022 at 14:13, Javier Martinez Canillas
> <javierm@redhat.com> wrote:

[...]

>>
>> +/*
>> + * Shutdown the hw if we're far enough along where things might be on.
>> + * If we run this too early, we'll end up panicking in any variety of
>> + * places. Since we don't register the drm device until late in
>> + * msm_drm_init, drm_dev->registered is used as an indicator that the
>> + * shutdown will be successful.
>> + *
>> + * This function must only be called if drm_dev->registered is true.
>> + */
>> +static inline void msm_shutdown_hw(struct drm_device *dev)
>> +{
>> +       drm_atomic_helper_shutdown(dev);
>> +}
> 
> Now there is no point in having this as a separate function. Could you

The only reason why I kept this was to avoid duplicating the same comment
in two places. I thought that an inline function would be better than that.

> please inline it?
>

That's already the case. Sorry but I have to ask, do you read my patches
before commenting? I have the feeling that is the second time that you ask
for something that was already done in the patch.
 
[...]

>>
>> -       if (!priv || !priv->kms)
>> -               return;
>> -
>> -       drm_atomic_helper_shutdown(drm);
> 
> It might be worth repeating the comment here.
>

As mentioned I thought about it. But then decided that an inline function would
be better to have the comment just in one place. I don't have a strong opinion
though so I could change if others agree that duplicating the comment is better.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

