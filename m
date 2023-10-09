Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 126017BE76D
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 19:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66C010E292;
	Mon,  9 Oct 2023 17:11:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E5710E294
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 17:11:13 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-504a7f9204eso5704206e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 10:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696871472; x=1697476272; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=30KcEZ4SIICqQVAYj3z91SvH9mOrlLfmUCguTSfxTSk=;
 b=qguY/Ab58d6YD3AlwkkeodrIirsKdXhi2J0LEJoDnAhr/9HnMK6bdmRWI/Z86hdH+b
 IhXx8qpo8yveRpUGy/fxagl183AnUrLj9gYk/6DYZrzI94ngKD0UXEbg+cOjHmcIqcxR
 EN3dznIfBSDR6O48qniyARSOMLLEmJN1S7w8bOpVOSRzZAI085PuZ/ZBnKfj3Hif0WJK
 uxQZcr8BNzBgc8NHZ662AjbI07OMZ1N7IL/Ag5eq8cIV9NBoVFbYh1myYle/d3esEHpS
 +4uCkTGcejP+oLRy93GcQ35yPp+e+yqdCmrhHAw0vZ1czAw0s55q//hFR0OW84TQU/Qg
 ki9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871472; x=1697476272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=30KcEZ4SIICqQVAYj3z91SvH9mOrlLfmUCguTSfxTSk=;
 b=UxjGGOHQahNywDR6AFnWdrK1tH93Zu6V27I+c4nQ9a3BNn/ZrEtrBs1RW4VaouOwjT
 rqUSjfsPgrbjPN3ofJn9DiZBI6DBYjwxi/Otgydi5Ko3hXdSUMoM8zU3txNHVg8Purn0
 2DIUXfqg/X1XGzxQSA182ZbG8JhIqS/koraQco7+TAEwAHZhXOuIYVXF9A/+FXCH/Gx5
 yuetiYWJX+jnW3P0jsNB2T0cscbVF9q/dZEyp7RkxPR8q3Sohp9ZayxXlw2EN8D8Dh6r
 Swrshl1Mo4yJIS/YUyJA0sXdfIoX1mimaVdLGChFB1BCX3UgQn/8gmzGHSHmfNNcsy5B
 2vvg==
X-Gm-Message-State: AOJu0YzoVAp2zcZhxopgdln7C/5rgLcOFE3pNl2fy/QLbW1fKdhVqZkS
 LaE9I9gBIhoWXA/Fl/OC/wICQQ==
X-Google-Smtp-Source: AGHT+IEBq766UMuWA+eeA5D2k84fHEbIsahHIHEvGO6Kg7wtTj42eDj0TYj1mQSbBwp3s1gqb2Niog==
X-Received: by 2002:a19:6456:0:b0:503:442:5957 with SMTP id
 b22-20020a196456000000b0050304425957mr12147556lfj.41.1696871471681; 
 Mon, 09 Oct 2023 10:11:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a19f60e000000b00502e0388846sm1475991lfe.244.2023.10.09.10.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:11:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 20:11:07 +0300
Message-Id: <20231009171110.2691115-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/3] drm/msm/dpu: enable writeback on several
 platforms
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

This enables writeback on several platforms where I could actually test
it.

Dmitry Baryshkov (3):
  drm/msm/dpu: enable writeback on SDM845
  drm/msm/dpu: enable writeback on SM8350
  drm/msm/dpu: enable writeback on SM8450

 .../drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  6 ++++--
 4 files changed, 58 insertions(+), 2 deletions(-)

-- 
2.39.2

