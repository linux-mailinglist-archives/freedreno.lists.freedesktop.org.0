Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64154731693
	for <lists+freedreno@lfdr.de>; Thu, 15 Jun 2023 13:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1497C10E4CB;
	Thu, 15 Jun 2023 11:31:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F3610E183
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 11:31:31 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f649db9b25so10227720e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 04:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686828689; x=1689420689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vbafB7CFldn/fkM2UpPUe2mkTVmTH3y0rkj38+8JLV0=;
 b=NC8aQtqVZ0za+j3+jkuyqg7gpl2clA4y9LK7dbY9kjM+DyapLMNII2U32RFEHfDJ/X
 kko7WS/r5bTt0pxMKt9WLMGrdPCalB50BLQqNxmcqzofAF9idKkzwTKhsdrrSOtVqoMO
 wJpcYXOp/Ix4mqZaX2OXQmFuKj++2wCHcMBxHNP3f9eHMhDcb4Ie/ZlzukLUgT8lNZAe
 LXPGGpemSWQp2GaiN3Gxk0GIk6oXWgfMt3lNSGXDJyiD2E+YHWlNFc4QjGE6Q0YMs5YE
 TXHjDGDBDZT/o+0pjo85pgikbNPsFeCEOvly1cqIgVqbgDQ7p2umYTCekkXbvsD+j7Hn
 XylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686828689; x=1689420689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vbafB7CFldn/fkM2UpPUe2mkTVmTH3y0rkj38+8JLV0=;
 b=Lag1j333JjUijx3NUelSsck7vRj0q5GgptLpLYKcbEroxv+t1ZyJv7H+Qq8yt+TtrC
 OSKianWQy7slfHyfGWr303cmL2U4apkcdTWNUzqnULPtc6QfOhYfmeQeTWCZLGXe+D+r
 vlneo2vRKQ6djm0/A73CU914I68vNpWr5g6rlm77dLQa+y9WgdqqoqVESt1c2tFF4mF6
 85bRnvBeocEE4eXNFYg0neLd5HNn3Xk+rXtaDbm5cZjADVQe88RYRfAfOdy5kUGtXOaS
 SiATJ0igw3gk3OeXs51Z7XDHZ/etdixV3s4FYa6ukF2upXCnrdx2nea6IHrY9ebhTl+y
 Q3nw==
X-Gm-Message-State: AC+VfDySQ79Tl1XN9ZeywifzNrHXA5giHa85HdCmbA+R3WqVPJCzXslZ
 4UFfd5/KQR9HLzRLO0gzljkF4Q==
X-Google-Smtp-Source: ACHHUZ5VYzmsikxsafYP0OLAIPuaP+UraK9xdVPdzYUjKg3TB7t20IZE8MTlcxjTp6aoA7d4uljNAA==
X-Received: by 2002:a2e:8ec8:0:b0:2b3:4acd:8477 with SMTP id
 e8-20020a2e8ec8000000b002b34acd8477mr3465408ljl.10.1686828689510; 
 Thu, 15 Jun 2023 04:31:29 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:31:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Jun 2023 14:31:19 +0300
Message-Id: <168682860382.384026.8056760292129315346.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614224402.296825-1-dmitry.baryshkov@linaro.org>
References: <20230614224402.296825-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dsi: dsi_host: drop unused
 clocks
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Thu, 15 Jun 2023 01:44:01 +0300, Dmitry Baryshkov wrote:
> Several source clocks are not used anymore, so stop handling them.
> 
> 

Applied, thanks!

[1/2] drm/msm/dsi: dsi_host: drop unused clocks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2d1ae9a5ae51
[2/2] drm/msm/dsi: split dsi_ctrl_config() function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/518269541298

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
