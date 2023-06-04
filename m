Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB7C72143B
	for <lists+freedreno@lfdr.de>; Sun,  4 Jun 2023 05:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AFC10E0DD;
	Sun,  4 Jun 2023 03:01:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA46B10E0D7
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jun 2023 03:01:43 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b1b86146afso14577721fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 03 Jun 2023 20:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685847701; x=1688439701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1X6WEtQyiptIxtD54x3vfD3H70MCzerg/dy1fYVu8V0=;
 b=Y9qE9DmKr3+7luq6lyoo3ph446uZQPaOv+f5sNK9nBEbTweY5lHFyEODPwBWSYvOcZ
 eOMHFVsvv9Cb7dwmY7/eOayugL0rnlTZhCck4P8nKs0ao0mCnbJGKjeiUcY43iIzK8/S
 10ZYW3v7b0Lcaf4MHVuq+YtfohtOEdXlM9NwQkm0xmMhUmtlY+My7acTKOkKQkJ57y8Q
 H/8EKsjG1SYX0HpGvw82QSFPOymgRRFgmdzSiG00cbp5STTnm3cs9Iro7riVajeTRUBG
 xnkdInqxTH7nZHkLhYyEaeaZQmqGZeOIDOmNwiIVWyfHhLIPu3BFryxztA29FElCPVmH
 T9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685847701; x=1688439701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1X6WEtQyiptIxtD54x3vfD3H70MCzerg/dy1fYVu8V0=;
 b=KriKIbChrzsASZEBM0961PMQUkm88yXiT+Q9rHuWFUoFHSdSmjaNsunUwRFzsfJrIi
 L5KzqBI5wFoMq1FH+YNrj9Kqdx3VznpHhapro3mkiPMUaTHHO6KjJR7Gz+n2JPvstRiS
 K3XwxRvDfaV23dVKtbvtjfQio+gKG07gbyuPwKscqSuuU8JpCsfCPTDnhxSHjBOSw570
 HsTBuHxhyYtyCm3h3krtXKnLU8RRuLCszHEd+Mo3YcjDE+wkFGvpnEuuvRJB4iNOGH7E
 6gpyjq1ZtsOq1neeiMy5rDcDnyJ3Foqnq2aRT2iFCElp8M2ocHiwcUzhpCZQyCskKlbs
 JCMQ==
X-Gm-Message-State: AC+VfDwq5ep4nk7z7wg26tSXbKjQRBgs7QvtN8l+2Bn3+qxWGHWfSfy2
 KpjD5uFVI8fztxm8jSLGLPnLnw==
X-Google-Smtp-Source: ACHHUZ7asWJzyIiTNQO6ArOVaTdqSH/P/V4O1sVnyoBURumJ6VpsuYlpXql7+1bSFkxOwUacFcMOhg==
X-Received: by 2002:a2e:9f4f:0:b0:299:a7be:5775 with SMTP id
 v15-20020a2e9f4f000000b00299a7be5775mr2131524ljk.35.1685847701800; 
 Sat, 03 Jun 2023 20:01:41 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:01:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun,  4 Jun 2023 06:01:29 +0300
Message-Id: <168584750429.890410.14758172280740009870.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
References: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 1/3] drm/msm/dpu: drop
 dpu_encoder_phys_ops::late_register()
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sun, 21 May 2023 22:22:28 +0300, Dmitry Baryshkov wrote:
> This callback has been unused since the driver being added. Drop it now.
> 
> 

Applied, thanks!

[1/3] drm/msm/dpu: drop dpu_encoder_phys_ops::late_register()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/95666ca7431c
[2/3] drm/msm/dpu: drop (mostly) unused DPU_NAME_SIZE define
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a659098d78d6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
