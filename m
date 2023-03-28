Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0946CCD87
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 00:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F0710EA22;
	Tue, 28 Mar 2023 22:38:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB75B10E9DF
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:15 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id e21so14180713ljn.7
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xzrHNhj4mC5D3BSVzsRn+bfppIAJb6omjbQHw5uSNww=;
 b=wiY9wELxeAw8XealgU0KrNeoQG7lMAOp1Z/t/H/9fpFrj99bdXDk3xvoZyst7EUVWh
 RALoCZF9lRQxK2hdARTVKrS0gQyoNnbezfUpz2E+T+FoKtfvI+9SRy7DvFmTJLJZW75+
 gkVF8nvXaO9+/VFTZ3x6CAYfryI+g8kQNSqIBmDgm/UQcOQrBY5XCViAvCDHm32N/Hz1
 rsx6cCol2oD9Gghtf3CwwequBRhFts3H7PWTGu29iue2gx+yu43CeOWgSEr7tHFUJ02k
 Fl/LiX33mznL3PzpUvaAV+qhtNDlapAnb8+ljW5eIeHJLmoXxmpIdZOzugE+KSnkO3tt
 JKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xzrHNhj4mC5D3BSVzsRn+bfppIAJb6omjbQHw5uSNww=;
 b=1hPL19HYZw8n79fpuFcVc1ny14zkjPM9g9zsrMgs0Wuk5zzod/r5/AI6gptnwd7gSG
 dmraUeoI6Orm9XMtn252qhlIs9W2094GI0vT1hKtCBaLuecbHUdpi/W84USIPVwrKkvZ
 O/dYlU/3ZB2v1zjU9eouWt3Hr7PYXLSxttYSP5StfVWE+rxDoAN4EIta1ryZfzGESCwn
 u8oh6h4J4MRWp7iiZUF1B5XDBEfHeER1X+R5AqxoxXGTgK5IBc7u2xx9VSl0kqhycdws
 DFhRCJpxFH95KsQCShjEinlrciTpUt2akUSIjUu2QcXLE/VDzhp2CgU7YjXfh5f+tSGp
 fbLA==
X-Gm-Message-State: AAQBX9ddFMJ4y+eQnDdj2DA3wuaWWweRBwDcelPBuMb8HHsypaPaWh4/
 For5oBLIWjfHE1MkUNtwk5u1Hw==
X-Google-Smtp-Source: AKy350YPdYgCgBPwMF71vrPCJWfK+dspAXZuTvv4O48LPCzNaPLnY08jSnb2j+86thVL4IGtKMf0qw==
X-Received: by 2002:a2e:7c06:0:b0:2a4:44a5:d4a3 with SMTP id
 x6-20020a2e7c06000000b002a444a5d4a3mr4760700ljc.0.1680043095309; 
 Tue, 28 Mar 2023 15:38:15 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Date: Wed, 29 Mar 2023 01:38:02 +0300
Message-Id: <168004255460.1060915.10055014271321088817.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326163813.535762-1-robdclark@gmail.com>
References: <20230326163813.535762-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm: Rename
 drm_msm_gem_submit_reloc::or in C++ code
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
 linux-arm-msm@vger.kernel.org, Danylo Piliaiev <dpiliaiev@igalia.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sun, 26 Mar 2023 09:38:13 -0700, Rob Clark wrote:
> Clashes with C++ `or` keyword
> 
> 

Applied, thanks!

[1/1] drm/msm: Rename drm_msm_gem_submit_reloc::or in C++ code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/be7772e53681

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
