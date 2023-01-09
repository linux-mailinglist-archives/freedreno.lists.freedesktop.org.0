Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C66D663587
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 00:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9FB10E511;
	Mon,  9 Jan 2023 23:44:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC4510E0CF
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:03 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id v25so15575806lfe.12
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ctFTCfSoJjTZfY+rdJcn3BKR4sJeVp5aACYPINpXosE=;
 b=D91kA370v1Ibjpwq0d6nIIOvQ1av9dICKJg8CSSMheH4MqYSESDGMdgyLpN8Csr4fR
 Njd/3P6uQsAzseNtpsoxIdpxOS4Abi69RCJs9SdDrqG+cpprSf+MWD0U9Kr7RPxSadTK
 s734qt40k254vmi8hP/hxGlU4ImTPgE0ltRI/j7+S2HtM1b9dwMC2xLG2YFcFfYYYAcc
 EO4i5pYBQlmueyRK/pBFFTge5IuIAzTnmdZjfxzy51a41nrLde7LjhrddMt69qakbnQr
 wqqHAjrpBQlu0PJ8LlQdkf/LFcNtXlStrEYQV0paVpbaP0JHKyNUU3Wupr03Hxdb2khy
 SE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ctFTCfSoJjTZfY+rdJcn3BKR4sJeVp5aACYPINpXosE=;
 b=sVk+AiFkqGBjYkYVuabNvP42RJGNbXLiWmvhzXINC4DGQDo45fthRqr3nodjEEbuWl
 mS6mQgUOLNPaZocenlmfvZaSsKDkvJrO5XMljBUiwTHCZPyr3fjotsLWGsXZdXfx4agd
 CCDMihksFsB3T/CrLsaPkw4NDnagQuzGsJZGLYqoA0/DuuoTuBZIsh3nn8+ezaQ3Xeaj
 SmDsaKMh3WZM7AQiON2JBvsCCE1QYe9dW270ch1eDTnN6ZxMFaSOBCzZ1IhWYrGzf2mn
 jTr4ASO6/Bt3cPLhHZ7t1sGTw5Z5oM0twq0FLboKI8rujYbgPNF7gHzEQyKvqmh9dZg5
 l8Qw==
X-Gm-Message-State: AFqh2kpaoz6SfibMdHEwxbFIQ8sNHJKFnJr5uGYNLO5+04/EWmMh4Mv7
 pglfPJLSaFvZPZSgz1Xta+rc2A==
X-Google-Smtp-Source: AMrXdXsFIuf4QQmVz+QkO6uFZg1ZOADgI3mb28RuhdCc6Dcd0DdQzCZta5vI8h5WrgQ2E87EQhSMLg==
X-Received: by 2002:a05:6512:695:b0:4b5:2bbc:e119 with SMTP id
 t21-20020a056512069500b004b52bbce119mr32182194lfe.65.1673307841874; 
 Mon, 09 Jan 2023 15:44:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 Jan 2023 01:43:45 +0200
Message-Id: <167330408776.609993.17059327526924867379.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109045458.316114-1-dmitry.baryshkov@linaro.org>
References: <20230109045458.316114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: display/msm: qcom,
 sdm845-mdss: document the DP device
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 09 Jan 2023 06:54:58 +0200, Dmitry Baryshkov wrote:
> Document the DP controller added to the sdm845 display subsystem.
> 
> 

Applied, thanks!

[1/1] dt-bindings: display/msm: qcom,sdm845-mdss: document the DP device
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d26407788cc0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
