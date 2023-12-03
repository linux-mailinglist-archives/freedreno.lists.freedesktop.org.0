Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9018022CE
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 12:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD7010E27C;
	Sun,  3 Dec 2023 11:26:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6313010E27B
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:44 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50be24167efso1569851e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602802; x=1702207602; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2WSOjrDN/6/FPqqfnjx8kzs7rgpm6bARfoNrfKT8u5o=;
 b=f00XxHnXRFxFoNMBsrKZl5whtfvkbEXB3aviKNH2pD/P6T3RQK3X9WrCEaJCeCHb6W
 HMdZZ6vgZkvC5VyAWD2Q8oJtTzHXlm3nUkYQmSnOt4Y+kQboXWt9iCXnxyl4zpYZhYpl
 8yqMLt2wyrLJNbP4aCYkNxTuehXEJt1Ii7UBUNdET/ZXVicKHYB/kvuJktDQMwl6BFiH
 f+psaqbWSBH5pepLta4Qjer8HxWP5H8F6uQECow0hRq2ANX9+Rfxs+352Pe1sLEylfEA
 enDCl8NNmzMyiQfLEoSuIH8cMbndKkZ0DwubVZeq0cp243PAlnx9Y0/UGPB/2A2/9WOt
 TjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602802; x=1702207602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2WSOjrDN/6/FPqqfnjx8kzs7rgpm6bARfoNrfKT8u5o=;
 b=RIeCtm59eIIzxB1cQn341nkqKMPlLjBtTrFo1bjs0pUMiPd2BOP5UYCXw6xcCh4sDB
 rDdsMumsX4z1KlyvQJeA5BlLIC4/evEgtiLSq3fHBqG/0+Rf4Q7qa5ubELEXjg/6lO/x
 n//1ldGKUO89uOqyK+bvHihnYaW4gMzJ7JzqpnWfw/QAcCKShCXeVY65G3Wj5Jlgn3i5
 meZyPf7HZQLgH1MfdJDzs2ZcHrTd8oPcEsV5DSG9F5PF8RspH1lcY6OVUBNEFGlxM0Iw
 pohK6XXVskgvQpKFmh+7XWE0Q7wSVrPujzOP8ezdhKULAZ4iSa4RNBPh/M3FSP9pnybR
 a6Gw==
X-Gm-Message-State: AOJu0Yx+bJtY+f+Tsno3LrAYCXvdg3vJx8pHx4+Owo4Y/phZjekOCglk
 p8gYJJcymPX9rI2oZxP57YSqXiina/TWPZIvJos=
X-Google-Smtp-Source: AGHT+IHynZOlSfJkcuHWfgzZaQed2kczEHlHE2eWDEQkdE5lbgHNM141ZJ4rYNfMifeay+hwSL6g0w==
X-Received: by 2002:a05:6512:4894:b0:50b:e88a:1092 with SMTP id
 eq20-20020a056512489400b0050be88a1092mr290454lfb.174.1701602802514; 
 Sun, 03 Dec 2023 03:26:42 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Archit Taneja <architt@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun,  3 Dec 2023 14:26:27 +0300
Message-Id: <170160265549.1305159.13000009091015495983.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230911221627.9569-1-quic_abhinavk@quicinc.com>
References: <20230911221627.9569-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm/dpu: fail
 dpu_plane_atomic_check() based on mdp clk limits
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_parellan@quicinc.com,
 quic_jesszhan@quicinc.com, nespera@igalia.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 11 Sep 2023 15:16:26 -0700, Abhinav Kumar wrote:
> Currently, dpu_plane_atomic_check() does not check whether the
> plane can process the image without exceeding the per chipset
> limits for MDP clock. This leads to underflow issues because the
> SSPP is not able to complete the processing for the data rate of
> the display.
> 
> Fail the dpu_plane_atomic_check() if the SSPP cannot process the
> image without exceeding the MDP clock limits.
> 
> [...]

Applied, thanks!

[2/2] drm/msm/dpu: try multirect based on mdp clock limits
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e6c0de5f4450

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
