Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3559D565AD1
	for <lists+freedreno@lfdr.de>; Mon,  4 Jul 2022 18:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2068410E4B1;
	Mon,  4 Jul 2022 16:14:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2849D10E06D
 for <freedreno@lists.freedesktop.org>; Sun,  3 Jul 2022 03:57:07 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id i3so8877982oif.13
 for <freedreno@lists.freedesktop.org>; Sat, 02 Jul 2022 20:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ixFS/lLVzK4AnsiITvXFoWkkOR9udc4jxnq+DXxte8Q=;
 b=ELDIg2fYmhNeuZS++FOlyGI7qQrJirWA67ek/O/GrP5yzY/ghQ4CdkuK7h5/GrW3gr
 1xwOy7pBdAEXa+aDGAa9weODT4On2ZDw/DQBRAWFvHkMJ2AWM4qLDOscQsPsyY8dBSi/
 8G3AKT8MyZz45mv0IKyFDy8dI6aeSrgeE5F5ByhdyIZn+xBCZKv9oReW1msAEYh4MjGO
 LSfUXS4bT3DAs0/ymlxwI00TxQtKcA6il4240yEdOksnu/3EOnu47y8lh8K5T7LZMSpn
 OWaFmFv4txw00507q6C7Qsx5DtJC6b/ODoct1HICemIDD9uq3NVq8up5GIO0LnJnaPmq
 s1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ixFS/lLVzK4AnsiITvXFoWkkOR9udc4jxnq+DXxte8Q=;
 b=LrTAJ5UkKa7cnQKQOpePHGbXDshh8Z4zrYMVn/GjT946UzlISQIrTJx7LP6RmgX/pd
 7NNl9oIWutTl1xhfY4ajEwIwJg2Vgc/3l2/qUOg9HvUkVwZ2umR7CaNObPUsEFe+VntV
 0v5pz7UabiAI4cQlMOhUNEKKRuJAKF8+/veun4rpywDzNUzf6f1bzsFAZdlXsTnM67fv
 F7Q4JV3o7aO1mconGovdzo9kh1e7HqQ/3Gemqg898TIxWn676GJeLc/rdvdZ3W9g4Teo
 4KweHOrz4msLTEQi5gOYGJYj+IUf4/v+Dn3ZDgnpf6hHbNPVSTjrE7y24iyH5gKs0vyh
 AF1A==
X-Gm-Message-State: AJIora/b7uMcMA5Gb5/MhQLFCGQGrAsLrSScIPqCF4flQO8PSO519WEc
 BQf7dWd7eg2LPSgoYY2h+QbOTw==
X-Google-Smtp-Source: AGRyM1s+D4CWrFB7V3Go5Nk6+CmS679ArdDFI7J3XZkIV/vfXB6uXOEqOFaxv/a5Y3dUyi9JYukbJg==
X-Received: by 2002:a05:6808:f02:b0:337:a7a0:204f with SMTP id
 m2-20020a0568080f0200b00337a7a0204fmr4055532oiw.68.1656820626379; 
 Sat, 02 Jul 2022 20:57:06 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 20:57:05 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat,  2 Jul 2022 22:56:02 -0500
Message-Id: <165682055971.445910.12967450195410688611.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220615135935.87381-5-dmitry.baryshkov@linaro.org>
References: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
 <20220615135935.87381-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] (subset) [PATCH 5/5] arm64: dts: qcom: add mdp_clk
 clock to the MDSS device
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 15 Jun 2022 16:59:35 +0300, Dmitry Baryshkov wrote:
> Add MDP_CLK ("core") clock to the mdss device to allow MDSS driver to
> access HW_REV/etc registers.
> 
> 

Applied, thanks!

[5/5] arm64: dts: qcom: add mdp_clk clock to the MDSS device
      commit: 2e4ae611ab73d8e35d6059fc30cb4da4cd568d4c

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
