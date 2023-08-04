Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B0B7704CE
	for <lists+freedreno@lfdr.de>; Fri,  4 Aug 2023 17:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2593210E725;
	Fri,  4 Aug 2023 15:33:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D81C10E728
 for <freedreno@lists.freedesktop.org>; Fri,  4 Aug 2023 15:33:23 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe457ec6e7so3871679e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 04 Aug 2023 08:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691163202; x=1691768002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UkJZcKj0fkFAOpA+ii9LBosfGNpWxtA1197WIIr/hic=;
 b=nR/+5J1icecG0BXV3DYt3GC7xVBsZqDhfRGA2zoYe6sxyaj5zBnJAeU/NOd2yOlUAQ
 zbxmbrN6xqJCLW3tWJb09OBvrHcRMcX/tSUealCPQVyT0qWTGWC4ABcQq7Woep6OEcUJ
 sib6kG2kaEBp/3rsdlXSxql1u/q2zx+RopJWYpmP+ZC+4yN36Nu2jxxNdV2ywjzULzR/
 7aWEjOhJ145JJT55vVjmft71Ey9AgNjBMRO04OFZvWQ36GHlqT/YL/XVUaW61JgvSOdD
 rmXFegDXal65g03lj3NBHP1MlbIhbj5P7B5ToGM4EgEQtl4SHONPDE5jPkEl0ssVUIbY
 juMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691163202; x=1691768002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UkJZcKj0fkFAOpA+ii9LBosfGNpWxtA1197WIIr/hic=;
 b=Oxgq/gkizKS0JcLh0Fhgr8QugoeZ/cynXIZJ4jUv/qKFr12qOPYn01vamh3byhYtAZ
 gdgC0QmUZWd6y4/Iq4A+Hwbp8UQW3m5fwGX/yYGZM9psGJdRTGBbZ0hYwpqzCUwURjCs
 tnzrqbvJ3seRBSfaEw8Bc/e2jVg4sPwA+fy6U3c2FBUJ1Mv5bn/tkVQFd6mAckclRXwN
 5Wz43sysXtQDWsb20QrMk8DyRMBa6BoJ2bagvRlwcBcPCSbqm/fjB2ltqM3157WTzgF+
 mtZVMy00KDodb1pDzNUb1CwsVz8AWErD8XvouOdgVHPbsCYenl7RIEVSaYW9Lc1cQa68
 n0vQ==
X-Gm-Message-State: AOJu0YwQFSYDO7PB15hATexAVnzMmIUZJl9T6FUD8PiQM1QMcUpzUZ/9
 1R1BQ02h8lX5AQPPoUiG6DsMyw==
X-Google-Smtp-Source: AGHT+IHIS9jgN3PSebWEsZkCoXHSbvwTkZqxiiIqQKiYiCi1TFo0VAB2FTMJzF63PVft4JhcyCWMEw==
X-Received: by 2002:a05:6512:34d2:b0:4f8:7513:8cac with SMTP id
 w18-20020a05651234d200b004f875138cacmr1464741lfr.48.1691163201896; 
 Fri, 04 Aug 2023 08:33:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05651204cc00b004f873ca4139sm411874lfq.71.2023.08.04.08.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 08:33:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri,  4 Aug 2023 18:33:16 +0300
Message-Id: <169116308154.148471.18222389077643257942.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230804094804.36053-1-dmitry.baryshkov@linaro.org>
References: <20230804094804.36053-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: initialise clk_rate to 0 in
 _dpu_core_perf_get_core_clk_rate
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
 David Airlie <airlied@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Fri, 04 Aug 2023 12:48:04 +0300, Dmitry Baryshkov wrote:
> When removing the core perf tune overrides, I also occasionaly removed the
> initialisation of the clk_rate variable. Initialise it to 0 to let max()
> correctly calculate the maximum of requested clock rates.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: initialise clk_rate to 0 in _dpu_core_perf_get_core_clk_rate
      https://gitlab.freedesktop.org/lumag/msm/-/commit/34202be95237

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
