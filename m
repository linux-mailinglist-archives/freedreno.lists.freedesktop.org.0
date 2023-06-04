Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF33A721437
	for <lists+freedreno@lfdr.de>; Sun,  4 Jun 2023 05:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8A110E0AB;
	Sun,  4 Jun 2023 03:01:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3ED510E099
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jun 2023 03:01:41 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f5f728c4aaso3946388e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 03 Jun 2023 20:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685847700; x=1688439700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iW8Li2n0rZD7NzpAXirqLsFNZMxHZzT9M5Uh4WLCquk=;
 b=oUuTNwpXCVwN7isRcBeO4rW750QoBBz0forLMpsixuYaTStFVRpB3hTRNR2dpPG6/K
 3jwkHqla4JIKwoS56k8vrxCd3aGjE4w6woxJ35bmU2V2kx6eLncAt/tLdooxUC5IJnMH
 GOx8loJ/JSsv/87umq1Rfm0Xtm+JiCCqZmhLMWvuUH4dDZH37jCzE4A6n90nqukZ8dca
 zzimW/4F7Hd0K2OlVBABitmLZ+FMXRHAEojG95alypaLThfwJfXgwqMFBTUT9Z0wb+Lw
 LZvs4gsd43NFawyP2UWgns+f1GRKRKyPxAfzpxb/K0NJlqBZjquRrbp1Zn4xlsImajF/
 k0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685847700; x=1688439700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iW8Li2n0rZD7NzpAXirqLsFNZMxHZzT9M5Uh4WLCquk=;
 b=MlWlxp0gqPrCyDihQo7D2WMKhdVFcqRMGc4G3JFjKmE0dpDbIs8Yc3oqJ7P/RrZamH
 Uh8jIGovnJ48TVW7vCNiJDmURi4R7bJIwji8+0M5AS7jAdkTpzH21IlSKt0X8m6bAxl+
 9zXL0zAki/DbbovawU+ipG0cAymnzlQpzdO1bd2C99gN2ybUV40CGGFUIGmY2TcetYSi
 /o0P/Nsvsh4NHTdl4wWoSdvNT/WnjVlBXNBLKPu5HR9RCLU7Ehtxy7DoaZm3xMfA9qAc
 SSWeeoQ1bez6U+aKYfvUIoCADWEGu1oyzT1vapnOqVpC614oF+sfJuJF44UgkRC2enxr
 WI5w==
X-Gm-Message-State: AC+VfDzQBvK2ukTntWiLlsZQYv1//oru278iMtOCzj//1zcQJPebcRBD
 ZzKt4syIPiFgSIS/u6zqmT1CxQ==
X-Google-Smtp-Source: ACHHUZ4gNdjSeZJPzmWovGSc/x4MjDwnYJBgKddZijOqQwsfXwnD9Ek1REVt6tKvEYHFV0jVQdtnow==
X-Received: by 2002:ac2:4f8a:0:b0:4f6:ac9:2eba with SMTP id
 z10-20020ac24f8a000000b004f60ac92ebamr1771664lfs.11.1685847700079; 
 Sat, 03 Jun 2023 20:01:40 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:01:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>
Date: Sun,  4 Jun 2023 06:01:27 +0300
Message-Id: <168584750429.890410.15848312463141330600.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <28644c5e-950e-41cd-8389-67f37b067bdc@kili.mountain>
References: <28644c5e-950e-41cd-8389-67f37b067bdc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: clean up
 dpu_kms_get_clk_rate() returns
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
Cc: Liu Shixin <liushixin2@huawei.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Fri, 26 May 2023 14:51:59 +0300, Dan Carpenter wrote:
> Static analysis tools complain about the -EINVAL error code being
> stored in an unsigned variable.  Let's change this to match
> the clk_get_rate() function which is type unsigned long and returns
> zero on error.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: clean up dpu_kms_get_clk_rate() returns
      https://gitlab.freedesktop.org/lumag/msm/-/commit/025e3d97867c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
