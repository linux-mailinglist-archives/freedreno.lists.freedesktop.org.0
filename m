Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C826CCD5D
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 00:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B3310E9F9;
	Tue, 28 Mar 2023 22:38:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EF010E9F5
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:09 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id a21so6997319ljq.10
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YqMzGFEFZ4G3mn3A0af48ETcAL5sqfZTnAC0vsbZt14=;
 b=eQ60LDXSa/NVEp4396sz4hz+p/96XdIU9Pip0WxwqTeDbs/roQIiiJVmWc9GSVUtix
 75nWME5ZWnYqrmc9OtB6ywbO8PCuGwcSWvA7+VyG507sdqQPwBU52LNtw2wD9+0FTTnt
 Zero1A208G+D6DXr65eVVOaCy+KTZCO+rT2m+wKv1nW/liRIU/skkpmM3493qRu5c+6u
 yoAm9taQWLP4lo01aBwSbiyRP0U1l3MC9RUQI9V4bKU2CuNFlCRVw9wp50v1LE4iDBCu
 femRp1Vup/4Tw38cu4zVg2e13QVXAlGVkp8rVnNcF1uiVGK/ljcDDKrx0mazDFsklpkw
 YCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YqMzGFEFZ4G3mn3A0af48ETcAL5sqfZTnAC0vsbZt14=;
 b=HFpTaCV6rCV8duRwWwslnIuruCZIz69YVQjBNuP5AtkGlSm3jGIjIGMx8KOy+DRf/P
 8oV5gGZWl+b+p6a60f0cEqWczbXmf4fNivG9f4gdOp2bw0mA61+/nlTx1yAWy9JEmoMy
 EsldsSnFUvDniI2HIqT9fvKizgjVFy1c4IEpj92JolhlL2QNTTXZJ6f7e3OcayOSTxEz
 cxCScsFAPWUCTLkSGBxAViJ68GAoXTey9MT7YEtNr4pBPZ1PFBPi5tYeO/Rnma2GZpGI
 nqv++nN+HTAcgxWSNwuMRw0SNKKcKhxsH6pwyT49vIrWVG07wV+6RfqswdTdQctpHJAX
 BqCw==
X-Gm-Message-State: AAQBX9d8u5ZktmqECMlOneXXMlSQHSauuk9wS9bRhxK+sfISYc5JfJ/r
 iRR+ygc3SN9LG5tF9dJ/vItw1A==
X-Google-Smtp-Source: AKy350bc+C5IlC+/Eg5CjRjnK2y1Lqc4kF2FkzeVDTt7xxGQ98NBtHIaDLDNL/a3JVnrPHhasMQXbQ==
X-Received: by 2002:a2e:a3d0:0:b0:2a0:7a74:b0d3 with SMTP id
 w16-20020a2ea3d0000000b002a07a74b0d3mr5509419lje.19.1680043089474; 
 Tue, 28 Mar 2023 15:38:09 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Date: Wed, 29 Mar 2023 01:37:54 +0300
Message-Id: <168004255464.1060915.109088243199139578.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224214133.411966-1-mcanal@igalia.com>
References: <20230224214133.411966-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/2] drm/lima: Use
 drm_sched_job_add_syncobj_dependency()
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Fri, 24 Feb 2023 18:41:32 -0300, Maíra Canal wrote:
> As lima_gem_add_deps() performs the same steps as
> drm_sched_job_add_syncobj_dependency(), replace the open-coded
> implementation in Lima in order to simply use the DRM function.
> 
> 

Applied, thanks!

[2/2] drm/msm: Use drm_sched_job_add_syncobj_dependency()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8fd531e6bc56

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
