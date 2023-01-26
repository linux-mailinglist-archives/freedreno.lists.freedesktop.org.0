Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9896067D4E6
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 20:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52D510E98A;
	Thu, 26 Jan 2023 19:01:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275A910E97D
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:14 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id k4so2202930eje.1
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E4KAdu7fVD19fhLCdbp0Xp7Oejh/hWZQK5rs1qa1Pvw=;
 b=O0ivBoSVGtwzhFUvGcQPGXy0ZpjVU53bvGlbLDxv9YMFLR1iKbfh/7qi3nYki6Jrh4
 KsQPmNbs8HG9utJxL5v2c4t7NpUl9tuDRgPAmg76uPoFkmMYerXkXhwO8CDH47W2PQYR
 limoICSUkkTbLVQDiB4JlSKW2nNy123HSj7rdAd8btJc0R5c9K7ml/82OYENz/IRO5Xt
 305CuRSyc8BUWMqRXhCDl8jmf5mQuDrYlPBPvfueYeJe+/hJwTUXijSRR7Sv44aDPL/o
 zUq0e5SXh9bI8qJ116XPvzU4TT1UEj/Xii/zTRwKTdBML1Jtaes/2IIBV83fMgFs6PvX
 ih5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E4KAdu7fVD19fhLCdbp0Xp7Oejh/hWZQK5rs1qa1Pvw=;
 b=gEmhKpXoy40zOLkW9QzrlTO6syU1XenRrAiTcVeD1OQV4VNpOOL8XKVU/giCd0V+q/
 bj8YugJ/BP1EyThcrS6jeDhrP9eS3tP67QE9wuIoS+EWLfgM79NPM9jUiBitraXwA9wk
 HOR9f82owJsKiGg9WX2DJdZ16FjsvTq0MVS4nQAaqkjoxfbTvWEgBx7ISKX0stq6Mi+y
 J3KWImih2ihLYSybj/qelzcFp109HGQVuAI0m8/VYoeqLExRMbGD8eQGGU8lgEV5KBXX
 ngU7h9h9TyMseT7Zzad/9WSLab9XTqOjB3g/r28cdRiMKrmueKBDckZqNxYXHl0NcHWE
 sHHQ==
X-Gm-Message-State: AFqh2kqE4Z4DD+9o8np5mAD7pQHmwLmi15YhDXhvMTEMK375SpllYudf
 x1/FG4D6L/g8y3qbLGqpIQIQzQ==
X-Google-Smtp-Source: AMrXdXvu41l675MshRL57jAMLr96sbxQRNIf58cOG9+EOAVwYFrOA2yICLT+QRXIrFtq+izPN+BCxg==
X-Received: by 2002:a17:906:3518:b0:7c1:962e:cf23 with SMTP id
 r24-20020a170906351800b007c1962ecf23mr36294374eja.37.1674759672791; 
 Thu, 26 Jan 2023 11:01:12 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Jan 2023 21:00:56 +0200
Message-Id: <167475959092.3954305.14748093187828121221.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230121135457.2788199-1-dmitry.baryshkov@linaro.org>
References: <20230121135457.2788199-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: drop stale comment from struct
 dpu_mdp_cfg doc
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


On Sat, 21 Jan 2023 15:54:57 +0200, Dmitry Baryshkov wrote:
> The field ubwc_static was removed from struct dpu_mdp_cfg some time ago.
> Drop the corresponding kerneldoc now.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: drop stale comment from struct dpu_mdp_cfg doc
      https://gitlab.freedesktop.org/lumag/msm/-/commit/daa9a2ec3e07

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
