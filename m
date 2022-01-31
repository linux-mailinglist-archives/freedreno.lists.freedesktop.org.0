Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC62D4A4DFB
	for <lists+freedreno@lfdr.de>; Mon, 31 Jan 2022 19:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EDA10E22C;
	Mon, 31 Jan 2022 18:24:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D8B10E22C
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jan 2022 18:24:38 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 b12-20020a9d754c000000b0059eb935359eso13839299otl.8
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jan 2022 10:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ASaMitgkrmjvWUALYvAmhPqFdUVqEq221GRVmLCMeTE=;
 b=rqsuJkGoTMqn8mFbQYyZwrLCcvhJUqSnNfCp4U3fwGRFtz9JLNTLwsE1uydNzvyUSM
 isdT9xZQYAtg4or5rWFfGYqxH3n6p103IT0NkgD26NordbifY0CYtyFcr17pTq+jAKkm
 3F+tphZsX2ObGSnuXwjv870IQj0jpVBjfZQMEO+Eo/OrXqTmuoAYy1j6bJFKc3x1ksQz
 sqPUqZOSJIbWMhNvzIW+EBtX7h/LVLVSW25oJvvWUdRO00niabFHoCsV9GkONfeAKr7x
 Si6KxBjod6x7neUpuc3vi2Eo7WtnSoXOn0HiCrYM0JssDdzGY6MGE80iNlzi7T9XKbKd
 ILhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ASaMitgkrmjvWUALYvAmhPqFdUVqEq221GRVmLCMeTE=;
 b=zAvsyQRhH1pfnj8vUDAjx0R3DSe1mXw+sTGeL73dPmSltuKuVro7LlLzTGLtAEvu8z
 cpcqZ94u4QpiyJKYgFECosO+7bzl2jtU/8UPx6o3NgEeksz1GMWJTwT1mfh5nqnmFySV
 9ikFhulRVI1Fbs3U1zx0HvC5L/zxnIWcMziBN3ZWOtj0SAtPaDEV5csWCtPCIwHZ/a0J
 DvEPFwVJdSHPNfyGKaE0/F/0/EpZeeb0wDxtQty0a54BUfxOIAoWgaGJaKGc3SdeJMgJ
 N2h9oX3HZVNdWMrlSQpx92+mdW2/4et5YPa2Qg2QRhoxDFs9uGZOwVrNSQi2GiMXTtJ4
 f3uQ==
X-Gm-Message-State: AOAM532zb81JOlwjG/yMxaj7ASwLg19oIiEfQCJzFcrNo0bh+09MKMSQ
 YGrSrwTCcCfWU1caG17JnHMSOg==
X-Google-Smtp-Source: ABdhPJxgjyy80Q85q0aqiH2ROnY9l3ptaA8QRaWNJ6IMhnV4OxQaFvhJtYAM0/1o4A6hsHWQw7QnDg==
X-Received: by 2002:a9d:3661:: with SMTP id w88mr12285764otb.245.1643653477318; 
 Mon, 31 Jan 2022 10:24:37 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id y19sm3273722oti.49.2022.01.31.10.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:24:36 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 agross@kernel.org, linux-kernel@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, robh+dt@kernel.org
Date: Mon, 31 Jan 2022 12:24:25 -0600
Message-Id: <164365345128.3009281.4776568093879192722.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1637580369-876-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1637580369-876-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v4 1/4] arm64: dts: qcom: sc7280: add
 display dt nodes
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
 swboyd@chromium.org, robdclark@gmail.com,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, seanpaul@chromium.org,
 quic_khsieh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 22 Nov 2021 16:56:06 +0530, Sankeerth Billakanti wrote:
> From: Krishna Manikandan <quic_mkrishn@quicinc.com>
> 
> Add mdss and mdp DT nodes for sc7280.
> 
> 

Applied, thanks!

[1/4] arm64: dts: qcom: sc7280: add display dt nodes
      commit: fcb68dfda5cbd816d27ac50c287833848874f61c
[2/4] arm64: dts: qcom: sc7280: Add DSI display nodes
      commit: 43137272f0bc5e05e4c4c6f7bfce017bfb9e16b5
[3/4] arm64: dts: qcom: sc7280: add edp display dt nodes
      commit: 25940788d170251373d8975d359706350818fa0f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
