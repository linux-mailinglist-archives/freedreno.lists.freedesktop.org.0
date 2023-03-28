Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983616CCD8C
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 00:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B900A10EA25;
	Tue, 28 Mar 2023 22:38:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136A210E9F5
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:15 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id a21so6997498ljq.10
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8uJ+dREdoTJrUO/jV2t+HGD1km8rKwGduSmzZBjBU7g=;
 b=D2ECxZSeCKcuEvhongZrmzkPveDQF4kcPot17cg0PKP8Oe9v1TXMjkysUxXvirw58E
 Y4z0vwOZXFHlRZHvvHSDEBK2bnpGDJ1qXxrCzHPan0WXYcyqnolNZPnfGcVVBO3QYRaV
 XD9Q/53oyXNoABLaeYxBuvz+Q+gpOUDpzOggu205Uomy8DzbkAYtb0pkpM2NmxsXyzxR
 4Du3UYAdVMVfZWLUHtelQ25Ia0Dyueu65pfTZNVWgXJbRoRLkLsVSfTiIvCBH3Fbl80M
 8Y4arARf6kFczQFSBihSefxDoB0HXdGj70Y+fZ6/9g1FHbIPO6Y/RMk5s8Z9QIv4noYI
 UMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8uJ+dREdoTJrUO/jV2t+HGD1km8rKwGduSmzZBjBU7g=;
 b=MKWx7sEzjjsN4baW0Ti8eg1ylw3cnnJIlVZDRK9GPYwYSoKUVdveWhMqhVF1ShPS9X
 GD5zywEtYe8SvClmwx7eWeRSjefrXb8yGOmx0tEeJuIPLmhbJAcM5gH/BSBL1J+pg2jx
 eqhxRfL9wyROkjSXfnvEwXk9PWxbtbsZVLA2wu31f9Ed0pYgSmOXEv2W0fII1eTXAP3M
 flhyXyZM+Em3/uSljab0EWJJmJjFPLVa6BV7i3Wi5uCEkR0541IWy8lZl8/ypNMhttzD
 ZFKUGdhadL3SGSDrf8F7tMM7En2rGRYSMrkILfoH3bSGbE+qJ4jSjSOogtRbOhpPMovu
 r9uQ==
X-Gm-Message-State: AAQBX9fleCbl4xBGysqYqrdfrvAqWHPMIGgdT9q5fO2xRpOueMa7Ac/m
 EQmFVU+1wBxYsEzyM4CwYCJwFA==
X-Google-Smtp-Source: AKy350YFBAq4dymHWHmkybxynzGNIcJh1mPRco8Jz4A0vFkG6OeccjLzq8XYc0Dwn8j6VAfFKQptBw==
X-Received: by 2002:a05:651c:d0:b0:29b:b01e:aa68 with SMTP id
 16-20020a05651c00d000b0029bb01eaa68mr5645839ljr.40.1680043094640; 
 Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Date: Wed, 29 Mar 2023 01:38:01 +0300
Message-Id: <168004255459.1060915.15692339879242886666.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324220013.191795-1-robdclark@gmail.com>
References: <20230324220013.191795-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm: Avoid rounding down to zero jiffies
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Fri, 24 Mar 2023 15:00:13 -0700, Rob Clark wrote:
> If userspace asked for a timeout greater than zero, but less than a
> jiffy, they clearly weren't planning on spinning.  So it is better
> to round up to one.
> 
> This fixes an issue with supertuxkart that was (for some reason)
> spinning on a gl sync with 1ms timeout.  CPU time for a demo lap
> drops from:
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Avoid rounding down to zero jiffies
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a5c5593477b0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
