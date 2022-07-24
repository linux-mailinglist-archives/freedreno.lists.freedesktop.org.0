Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84C357F6BB
	for <lists+freedreno@lfdr.de>; Sun, 24 Jul 2022 21:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A423510E63A;
	Sun, 24 Jul 2022 19:51:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0383D10E2DE
 for <freedreno@lists.freedesktop.org>; Sun, 24 Jul 2022 19:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658692260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r9inbt98jsYkVMrgoCWp1i9QvqhbBgRlizGTcBJDaPI=;
 b=JAX3lu0tt5rl8zs/4WPjYStEneazLZ/AtIslnKwXNqMp0k0Pt/wnK1O/uxeyaV5Aw12/K/
 rESOTmwp5l/yh5TD4Tm68nQtvJVq3s8aDUGJBAmlBLeEdq3OGZehORhnvFPnb93CZzmCEj
 p35bHFPIq5uBayZUfDgebb43AvU7T1Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-qdulND2MMeuYnsTtb2L_4w-1; Sun, 24 Jul 2022 15:50:59 -0400
X-MC-Unique: qdulND2MMeuYnsTtb2L_4w-1
Received: by mail-wm1-f70.google.com with SMTP id
 c62-20020a1c3541000000b003a30d86cb2dso7543536wma.5
 for <freedreno@lists.freedesktop.org>; Sun, 24 Jul 2022 12:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=r9inbt98jsYkVMrgoCWp1i9QvqhbBgRlizGTcBJDaPI=;
 b=gWUGrTZdIk5B82dd+hWhq8N/KU5t8lxC9pU0PO+uo3LnUyKEZREd/EtUn1p18LrqBv
 B2pMws9TDeSF1EYQcuGeEv6us/M8d3uuF82zVmRamfXGW1eXjAA5uAMmXA2AzgdwV38a
 HCbdGfi+OTrp4bVhIMDiFx1DZfHEu5WUfhXe78cwmxM1oLvXT+duxBJ1szpulbNIpg95
 m87t0nsyxFX6MxQMgaquPG0XnpT0qasN+7BECEyueJBukGcpR6NQXxbbgZBDBrUABMAW
 0cOuMKMCs9d6zDEPd67Ci4IVSNVJ+k4Ud0MDEJrayN9JVcLZ2Mo1tDLR53NGV35stvlo
 BAQA==
X-Gm-Message-State: AJIora/+m1d4gF6YNgdyF5fuEhFvzplSIKeZSkQs1HAVHKslokzJteF7
 roeaqT+3Pte+g4Hm31m3i1bOpYiYVaEhxZb/4TL/tzsPMe3don8uIz2bGm/KNCfONgXDhiQ7Wj0
 P50Hq1rn2YCdko5Hb/hLuepdJS9g9
X-Received: by 2002:a05:600c:4fd5:b0:3a3:4664:6d55 with SMTP id
 o21-20020a05600c4fd500b003a346646d55mr6458340wmq.73.1658692258606; 
 Sun, 24 Jul 2022 12:50:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uoDoNu1JLD2TNJP7ydWkOxddGEuigmdMNKn4c8VjBMMj5w1Ik7ZxaOU03qLsLDrorqkPvlCw==
X-Received: by 2002:a05:600c:4fd5:b0:3a3:4664:6d55 with SMTP id
 o21-20020a05600c4fd500b003a346646d55mr6458323wmq.73.1658692258383; 
 Sun, 24 Jul 2022 12:50:58 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c510f00b003a30fbde91dsm17433209wms.20.2022.07.24.12.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 12:50:57 -0700 (PDT)
Message-ID: <630a6654-0305-f3a8-e062-f13a0074d35a@redhat.com>
Date: Sun, 24 Jul 2022 21:50:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220724111327.1195693-1-javierm@redhat.com>
 <CAA8EJppEpPe4nfZ_kvNen6shSvgyUoL3adSQfhhCGCS2VmVZhQ@mail.gmail.com>
 <6b3f98db-83bf-41cd-b23d-79b455a06ebd@redhat.com>
In-Reply-To: <6b3f98db-83bf-41cd-b23d-79b455a06ebd@redhat.com>
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

On 7/24/22 20:47, Javier Martinez Canillas wrote:
> Hello Dmitry,

[...]

>> Now there is no point in having this as a separate function. Could you
> 
> The only reason why I kept this was to avoid duplicating the same comment
> in two places. I thought that an inline function would be better than that.
> 
>> please inline it?
>>

Or do you mean inline it as dropping the wrapper helper and just call to
drm_atomic_helper_shutdown() in both callbacks ? I'm OK with that but as
mentioned then we should probably have to duplicate the comment.

Since is marked as inline anyways, the resulting code should be the same.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

