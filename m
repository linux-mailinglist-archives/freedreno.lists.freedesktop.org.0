Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEEB436AB0
	for <lists+freedreno@lfdr.de>; Thu, 21 Oct 2021 20:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882666ECE3;
	Thu, 21 Oct 2021 18:40:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FB36ECDE
 for <freedreno@lists.freedesktop.org>; Thu, 21 Oct 2021 18:40:10 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id 145so1564394ljj.1
 for <freedreno@lists.freedesktop.org>; Thu, 21 Oct 2021 11:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=9wIvFY66/uQWTspqneatru5hG7uYgyRnzp2YO0R4wtk=;
 b=G3z7ykO4X+E851ch43bnUaOUol+AD2Au4q7+vF6L6OnedzItcq6j+AyjMJZXgsAm5G
 4NgVlSpK4iGvkeRhMO9xAtHEGdamb8cY8PdA+i1c+0A5VFd2nzixjtDM1AQC22Rs+rEH
 bUBS1kF+LNZPPSXCD2ajaZyd0w2InOGOf1TuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=9wIvFY66/uQWTspqneatru5hG7uYgyRnzp2YO0R4wtk=;
 b=w3+oMNIfc+dIquv2oO8wSsW6GSDkg659T0dA+hXaUBx04vf75b+2dlY5mFMiAjRHgS
 fDPCxNw3WqSl2Qy37JAmetUKOvX6CHmCgu0BW3fNE+t8JAEiIuF5kwJHAmwJh4eFX1Ej
 JLi1d9y+deNdc1pAyAxt2a9WjqJncwpPeQM2rP/VWwzpg+ttqgC8aMhHcaxPu4vJ5gc+
 9Vsp8wyGfDXPklOyekKc07CiGyvVvmxwYSCVmzE4WRArXVmmq7NrbYKJuzZZG2GQAF7D
 SCgdEYl/ceMsnYF86Pm2sVGU1I6dGxC3F/za4M0Df4AWhRiREvJjc4oAACnlS8jdVTiw
 YxiQ==
X-Gm-Message-State: AOAM532i4smkaIMzIFvWiyKBITBUa4S85Y1vZcIWhoWplGqwkp/AY8rW
 OvQ1MhupFz2aflXb9pgX5XfhQSi4lATIUmKozujVMg==
X-Google-Smtp-Source: ABdhPJxRC3Uf92k15ghzxzXlSSeSrHGQSqtbHF/z5u6aHclpYNvhUUJfMMIi/ktRjLpdoaeaGzmBSam4G9bujYQeCd4=
X-Received: by 2002:a2e:4e1a:: with SMTP id c26mr7489198ljb.351.1634841609244; 
 Thu, 21 Oct 2021 11:40:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Oct 2021 11:40:08 -0700
MIME-Version: 1.0
In-Reply-To: <1634738333-3916-2-git-send-email-quic_mkrishn@quicinc.com>
References: <1634738333-3916-1-git-send-email-quic_mkrishn@quicinc.com>
 <1634738333-3916-2-git-send-email-quic_mkrishn@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 21 Oct 2021 11:40:08 -0700
Message-ID: <CAE-0n52Me9UkR2Fk=x7QKxNy8PdjB8xPNsp3h=gN1ubMEgyzDA@mail.gmail.com>
To: Krishna Manikandan <quic_mkrishn@quicinc.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kalyan_t@codeaurora.org, sbillaka@codeaurora.org, abhinavk@codeaurora.org, 
 robdclark@gmail.com, bjorn.andersson@linaro.org, khsieh@codeaurora.org, 
 rajeevny@codeaurora.org, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/4] arm64: dts: qcom: sc7280: add
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Krishna Manikandan (2021-10-20 06:58:51)
> Add mdss and mdp DT nodes for sc7280.
>
> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
>
> Changes in v2:
>   - Rename display dt nodes (Stephen Boyd)
>   - Add clock names one per line for readability (Stephen Boyd)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
