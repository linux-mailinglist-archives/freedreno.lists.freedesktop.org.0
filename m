Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BCF6DAB28
	for <lists+freedreno@lfdr.de>; Fri,  7 Apr 2023 12:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03D610ED5F;
	Fri,  7 Apr 2023 10:00:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F7310EDAA
 for <freedreno@lists.freedesktop.org>; Fri,  7 Apr 2023 10:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680861602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vxzX051vG79fA2lg01PCCeNW25HR0i9loTgMaHJhE/0=;
 b=DHCbkNq4SAbp91DqiDSix0x0JnaxVtWoXH0yWxdDISB4zUqD8aPdJ+xYg9VFeelWaaT0Pq
 uO2Dcnu9arBkcwZIi+BHEhhClDkVdPnHDbRYf2qHhREW1Y4vAq6pVFMWQbtX85E42zswYI
 66SAv+XWeu6W50ASVMFozys/cNNoQfw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-KM7hRNSSO2a_yMEEcS4UBA-1; Fri, 07 Apr 2023 06:00:00 -0400
X-MC-Unique: KM7hRNSSO2a_yMEEcS4UBA-1
Received: by mail-wm1-f70.google.com with SMTP id
 hg24-20020a05600c539800b003f066c0b044so2590187wmb.0
 for <freedreno@lists.freedesktop.org>; Fri, 07 Apr 2023 03:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680861599;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vxzX051vG79fA2lg01PCCeNW25HR0i9loTgMaHJhE/0=;
 b=1zpf/wmAxfppSUd0aPcmxURVisVcAdeqaZVUz6V9xROS/INPJbQNPU1bGUrCsIqoZv
 usU6SHtVLvzegf8c+Q8fhPFVaF7BBgI7o7ZMvA0fEeDCK+0tCmnkVREXM0IExHcN4OrU
 V2z1AatRHON5QezkuoRGS8vjSc1vnKg8M/PbArN9yzqHiSAlrfZRKIS+SfilBMD/UY1B
 4n1WmBPoW7qGLPy1UK4nXtu94H8eSEBNSvg5v4+b1AAxhcDpfmTWIBvCumqOdmOh+8VS
 0XksPOD155Nmq6tjsfTJMyf0WXYIWWRVX1yzk74JfyS6bZalT5OVEk8Ij1rdEMCZgynM
 oI+A==
X-Gm-Message-State: AAQBX9dwj8/os2EAG81cX/mgdP+bS3Hjhf6Dz6XMBRTWzVKPXsfBTMIX
 HMA7OLTbp5spPGXOgC+ih2HyrbWH9hxDwWooqFSSUGGqag3nX2gVwQhkb+lt1EFgu8dAAcM4r3E
 Z0gu+T259qgGFFRxU5sUBVLoNL1/l
X-Received: by 2002:a7b:c7d1:0:b0:3eb:38b0:e757 with SMTP id
 z17-20020a7bc7d1000000b003eb38b0e757mr1043870wmk.10.1680861599792; 
 Fri, 07 Apr 2023 02:59:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZAbkcTuKHHx1PTF9JjuVOy7h+gk03bYHMX2Dd+d/sWYJgdy2EcgK92+pjvlc6XSCkqiq+Z6Q==
X-Received: by 2002:a7b:c7d1:0:b0:3eb:38b0:e757 with SMTP id
 z17-20020a7bc7d1000000b003eb38b0e757mr1043856wmk.10.1680861599506; 
 Fri, 07 Apr 2023 02:59:59 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h11-20020adff18b000000b002e40d124460sm4075512wro.97.2023.04.07.02.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 02:59:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
In-Reply-To: <20230407010741.2033800-1-dmitry.baryshkov@linaro.org>
References: <20230407010741.2033800-1-dmitry.baryshkov@linaro.org>
Date: Fri, 07 Apr 2023 11:59:58 +0200
Message-ID: <87355c8129.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: Re: [Freedreno] [PATCH] drm/msm/adreno: fix sparse warnings in a6xx
 code
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Sparse reports plenty of warnings against the a6xx code because of
> a6xx_gmu::mmio and a6xx_gmu::rscc members. For some reason they were
> defined as __iomem pointers rather than pointers to __iomem memory.
> Correct the __iomem attribute.
>
> Fixes: 02ef80c54e7c ("drm/msm/a6xx: update pdc/rscc GMU registers for A640/A650")
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202304070550.NrbhJCvP-lkp@intel.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

