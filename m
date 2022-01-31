Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B92D4A4DFC
	for <lists+freedreno@lfdr.de>; Mon, 31 Jan 2022 19:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFE010E340;
	Mon, 31 Jan 2022 18:24:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22C110E2C8
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jan 2022 18:24:39 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id 4so3879391oil.11
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jan 2022 10:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DMU9AZ9IHe9vHLy7t44zKNg+xudXJC08v+EXB0Qau88=;
 b=eE3owyETd86rhiBoFQjfQCbd3zoTyOn7J7I7j1tKYVNaybZKuI+UYZX5/rrH5IkNbn
 qPD2IHMEzaWJYo1c021WfPL23XeASt8IK96uh5ZmHK5/Vj/pqZKu6Df6IkRYF5upCWlg
 ZkzT8Qgs9dv7S6deVCH5YPSH1yIxG1/OUYu1bY1DTiHcS12IiWKHLkIDFU66V2pPO7N4
 tGBFXcUF8mxqa4xiIePkiADB8nkstet9ECvfZxsnGMfkU+Bci+rkMNbP6vLUUDIguoNX
 DSeJ6hXDm9kPwj3lyJEAoJNxhIjcdjWR1rCQK2YkH122o3j3uSZMr6gIbjCQOhIW9GM+
 hVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DMU9AZ9IHe9vHLy7t44zKNg+xudXJC08v+EXB0Qau88=;
 b=cKkBM4EGgFLKmCrFgnGWc+KrvN/Jzx2ThEwQrjLfJO3+gwffjtyf3Ns7rsOLSwT07S
 9y2+kuuQYFwZjITT/zrTgC+g0iYG3mgtxlCqR7OSMYcZ4fFRdLiSp2bpUFjfUgGjVvhQ
 6O7jCjLIiRZeae2rhxdfehgS+MNibL1p3mO/oFHcfC9JN1Pb538fOpvcdSKarInNJFXG
 yZ9rUfhO4yU7JUZPTe1VRSAxTAMlEIwKgfq//5TjCxhkgpApL9s3Hav4SlQH/15Tihb6
 Rqt5GqSUR7yIZW0/3PopgmbH/r2mreJF/NV2LSCUXlQ3G0nhUZOBNU8S9UEopdlIQwvt
 KPrQ==
X-Gm-Message-State: AOAM532dkEubJDv33/Vw4Li20rp7LG2hUTuwaoGl3vh/HpApFGM52Rke
 y9jHSVSdJ2SuhJtxOLc3e41nrQ==
X-Google-Smtp-Source: ABdhPJxt0KJaiklBho/V1Ui+XsEAZA5Z3/ybA635AsaKfaB6rAOtODj3zteALDtbdIVqTZwrEtYSGA==
X-Received: by 2002:a05:6808:1247:: with SMTP id
 o7mr17349933oiv.75.1643653478569; 
 Mon, 31 Jan 2022 10:24:38 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id y19sm3273722oti.49.2022.01.31.10.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:24:37 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 31 Jan 2022 12:24:26 -0600
Message-Id: <164365345128.3009281.16859131025980734527.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1637580555-1079-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1637580555-1079-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v4 4/4] arm64: dts: qcom: sc7280: Add
 Display Port node
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_abhinavk@quicinc.com,
 swboyd@chromium.org, Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
 quic_mkrishn@quicinc.com, seanpaul@chromium.org, quic_khsieh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 22 Nov 2021 16:59:15 +0530, Sankeerth Billakanti wrote:
> From: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> 

Applied, thanks!

[4/4] arm64: dts: qcom: sc7280: Add Display Port node
      commit: fc6b1225d20de0298a7b0e52eb3843d71e1992e8

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
