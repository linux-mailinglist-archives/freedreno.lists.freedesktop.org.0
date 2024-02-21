Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1572A85ED42
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 00:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A8510E83D;
	Wed, 21 Feb 2024 23:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="glIR0tjP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9E310E83B
 for <freedreno@lists.freedesktop.org>; Wed, 21 Feb 2024 23:43:16 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dcbd1d4904dso8016900276.3
 for <freedreno@lists.freedesktop.org>; Wed, 21 Feb 2024 15:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708558996; x=1709163796; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WFR+rdCdcNXgjwmjuY7WFWRvujdikiPSr9iXFhu+1EA=;
 b=glIR0tjPHcjOPcYYF7UOXanIOB5tpM8r8xmJGpAz1YRBTMuDIe3AUOuQEhoMAAbHGW
 Q+TKDs8wJQhzt8fo3mfx6DJ0a33AbuxpF01tyvIteg3UE4NjUU7jvosu39y2WsdD+uor
 0oS/tMzbx51RVJ1cvqk0l43Cod2fFZufwm5cR9S/k8cX+uOP9EH0psRE5K+OpEBoYLZf
 FYgNaoe3MFiHU/FEQ0RY133QQWa5EX9kvrv/n9kzb6jzxW+s5Bj4jNNd8aXL3lX1TrXU
 0t3xjV3B84yrwkduFbu7K6z6NhGfnzFBFQu0DbyrBcZ445o5jmJ0RaWcEw4D3ADO0W5v
 n5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708558996; x=1709163796;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WFR+rdCdcNXgjwmjuY7WFWRvujdikiPSr9iXFhu+1EA=;
 b=IR0ntG2oQrdJiHi+BIBEBUgPH6wHPXkxsxN4fyb/Mv64PvWUgsz0AHqu7KoIHEujXa
 PzaQ5+gzQWUbjvvNPSvnYJ6v9rNeshC8ZF8XKULj4m7Qu4VX42RgFCcqV017y8Nqs4AF
 3/RtwaDBSM2OKsHAtvBWdY3ljbQeofuG02AaVTVkl7K1FShptTOl5eByQNpnZHWKS506
 E4996fj3veW6gHboEduD1yGZQJf9KpxDtCl3WgG3zscgLlCXKR4zZjz/VFitDbjCoZWH
 Y5KuYPvdgPwC3wtxEHqPrJHnJMghKLXybeMytanw9hwHRT574IAVZYnqJmPyDDXNiwGJ
 E4gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW08uoT4f6an+e3KpauPFbA8HlJOMxg27+cXZRB1orEXY9mx4CnrbGR/sAWoAdT3hTru6D7CmiACSVu0T1Lt4bJIMoDviZQXyA43/C7UiXO
X-Gm-Message-State: AOJu0YxiWk2xpHMfdgl0by+lTyMCSPCEEcRHSbeoQPHbFTEsS2xeBERY
 vv6Bs5qG7nw2U87Kg6mDkpfQvgy05A9Hl4/d5QOsJx/MMiDOOjSNmKCWfgnAuD8A9fN0XC/2G/H
 cts7fHszorxkBNDpAt3608Om79aEveHkvS4ratYmZ5Iam+61t
X-Google-Smtp-Source: AGHT+IFjJBtN7MtXNcf/QQ3e4+26sEK2XOSpTmqDfd6w2TNPck5yPGYCu8CgXttPPvLLkfQppUj/9j3CGsKu8RzEuYE=
X-Received: by 2002:a25:b1a0:0:b0:dcc:693e:b396 with SMTP id
 h32-20020a25b1a0000000b00dcc693eb396mr916615ybj.2.1708558995841; Wed, 21 Feb
 2024 15:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-2-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-2-dc0964ef7d96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 01:43:04 +0200
Message-ID: <CAA8EJppPM9M0Jsb=GtqE4sdzWsKewEwkgKtF=Kb+n0tXZNSHkA@mail.gmail.com>
Subject: Re: [PATCH 2/9] arm64: dts: qcom: sc7280: Make eDP/DP controller
 default DP
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> The newly introduced mechanism for selecting eDP mode allow us to make a
> DisplayPort controller operate in eDP mode, but not the other way
> around. The qcom,sc7280-edp compatible is obviously tied to eDP, so this
> would not allow us to select DisplayPort-mode.
>
> Switch the compatible of the mdss_edp instance and make it eDP for the
> SC7280 qcard.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi       | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
