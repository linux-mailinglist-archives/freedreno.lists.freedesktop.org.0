Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 912F466359D
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 00:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF7910E522;
	Mon,  9 Jan 2023 23:44:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14B110E51C
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:10 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g13so15615064lfv.7
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TfEuuSwlBNCNhQ0V5aSlOKkpq1jL3HZF0gUtECm9ca4=;
 b=CabRoexvIHthMAjN9bOtYlrmiWIq4jOS4ECtS7o8jrMEW271dUEDGI7aD/YT+S1FL6
 GirrB+S8Ep775bg6drn7B5KgTSlZB4MBCIdhLQPkVpfqyzpi7q3J8Ff755AeIUW77o2A
 BnGA5Jwe3maS4Xo+J7FvcOAyNQgtBBXaIe2oybrNKVTDwgVR0erqPWVop3XmKkhf0PoV
 EDxqFX+0O1GIY1ZliEFP4Y3XQKm7G+l62ITYgdxyZT1NksiADTO/0nmkb+UCZx/SVBMc
 lOwbVd5zfa9q2CLpig0vHIwB7xXh9y0ZHMo+L6Rgm7TgohwwPzTB+kdemhJISUGoKVDH
 zMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TfEuuSwlBNCNhQ0V5aSlOKkpq1jL3HZF0gUtECm9ca4=;
 b=UZLvaE2AVZs/glyeL62oekkv0cyy0OeWIuDGQGz5KNjD/HY2jBJ9bSK9KkDMQ9niU+
 8aQeKNxSgWtoVUSabMWRGJcntOTXX9y8z2ToUjlcEs88vNf+iF3mKjIBdgZqsa2VSnqo
 gB6mXBt6jPBK4Il9MtxWRxBtNHw83NfHqNuKCCo3viWSwhDQdD8jBifWu/V7DkajWcPT
 wDC1IrDX+IjCvgkZxvQ9Jog6Gu4e9ULu9CDMfXKjkcbxtjPCvZCNx2sG2ls+/sfuAwY9
 lDCLNRULrvXEuHa+Ye4ES8628JR5AvKhCrvn5IBhCdro5D6z9svmOEp83M/0KN8FAYSH
 tl7A==
X-Gm-Message-State: AFqh2kp+1S7cj6Ar9ZL7r62wVxMYCabwEuE0vMtp62bHLZIRrQ8birpV
 vRycG+//KFb8redxW6VTUxJxYA==
X-Google-Smtp-Source: AMrXdXs0iF/miKI7qLAgrJfIAHY3483zTUbToR93HVGlxwSfxKxWogktXNquQxEzEQSx+CYsFnWgfg==
X-Received: by 2002:ac2:495b:0:b0:4b5:6755:4226 with SMTP id
 o27-20020ac2495b000000b004b567554226mr17831489lfi.55.1673307850418; 
 Mon, 09 Jan 2023 15:44:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Tue, 10 Jan 2023 01:43:55 +0200
Message-Id: <167330408782.609993.5872563380257036199.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221207220012.16529-1-quic_bjorande@quicinc.com>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v5 00/12] drm/msm: Add SC8280XP support
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Wed, 07 Dec 2022 14:00:00 -0800, Bjorn Andersson wrote:
> This introduces support for the SC8280XP platform in the MDSS, DPU and
> DP driver. It reworks the HDP handling in the DP driver to support
> external HPD sources - such as the dp-connector, or USB Type-C altmode.
> 
> It then introduces the display clock controllers, mdss, dpu and
> displayport controllers and link everything together, for both the MDSS
> instances on the platform, and lastly enables EDP on the compute
> reference device and 6 of the MiniDP outputs on the automotive
> development platform.
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: display/msm: Add binding for SC8280XP MDSS
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9ae2a57bdf9a
[02/12] drm/msm/dpu: Introduce SC8280XP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f0a1bdf64dd7
[03/12] drm/msm: Introduce SC8280XP MDSS
        https://gitlab.freedesktop.org/lumag/msm/-/commit/39bcdb416fb6
[04/12] dt-bindings: msm/dp: Add SDM845 and SC8280XP compatibles
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b6f8c4debc00
[05/12] drm/msm/dp: Stop using DP id as index in desc
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5d417b401146
[06/12] drm/msm/dp: Add DP and EDP compatibles for SC8280XP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5bd69fd16198
[07/12] drm/msm/dp: Add SDM845 DisplayPort instance
        https://gitlab.freedesktop.org/lumag/msm/-/commit/fa33f2aa9674
[08/12] drm/msm/dp: Rely on hpd_enable/disable callbacks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cd198caddea7
[09/12] drm/msm/dp: Implement hpd_notify()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/542b37efc20e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
