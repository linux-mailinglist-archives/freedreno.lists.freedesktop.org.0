Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E09165B5A7
	for <lists+freedreno@lfdr.de>; Mon,  2 Jan 2023 18:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A14D10E1B5;
	Mon,  2 Jan 2023 17:11:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD3710E1B5
 for <freedreno@lists.freedesktop.org>; Mon,  2 Jan 2023 17:11:01 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id d127so24002787oif.12
 for <freedreno@lists.freedesktop.org>; Mon, 02 Jan 2023 09:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fkrlTW01QZiW+rfRh4HCDBkrk4FHHNPvdhykJiEQI9E=;
 b=PSrfo52rXafgrME6wfouzPUZakPSi4zMi0esKLyfcUTdw3ZaLwczE7cqwq4+MAKDTp
 OPl7k/UcH/KvwiuB2Ijya3ZTt/RKJkdMX+lFk1LSSQFO/zSpVva0jt/XMT+DFhJyXmtv
 Dlg+29EtE39mSsu0+YR5gcVXPIgrI3oD6ZWMXHSW6Ja0FiNjgFuWd/WMvpBPRYm+Y2/M
 58YQCvE3Lxv7wYTUSWuWAcFMnMtr18bpUR8C+elEZ83RfcTyOs+rzRY011f1EPN5s+pi
 XWz0wLru8QmRF8N+6vF7Vn/3sS3eBC51zuFFPivBzOGyGSRasKOasO1UrkShD5TdzviP
 m9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fkrlTW01QZiW+rfRh4HCDBkrk4FHHNPvdhykJiEQI9E=;
 b=7640poaHJDatK3jyljvDj6WNxNOV0nDtAZmdXmH511pmViS2GgWVXYIoOk6hTIn839
 /cY1+ijtJRhLDKXFrsgUAdGXJKI4hD9YtBT+nW5biykSSaAgVVIkmBM6bJrmJI0SX9Vk
 tTGpF6C9HFx0xdStpXOOGb/IenBPoz/zIdwv7uhkSVmToQL7iwZZyIRIWUV9QcYXWDaj
 C3s9APTa3NJXC6yYd5nKWs5PCxgdT5U9vAWMqlEof4RoWV0fPlaIu9w/NG6djrqoc9Et
 fo40xoAc2n4bJgr1IdGRtPSWTqlHUhIXoWE64ESw+5Sxzx+sM3839X+trVg4EKw+ZFvY
 yqXw==
X-Gm-Message-State: AFqh2kr6UDuZo3RPIN8WgZ7X/SfxBNfnHmbW8Zw7RuvPyvIM+zyceLfK
 PrDvovi1Cv/sBhiN9tU/eSZI0PvpnyoAyp531EqhXw==
X-Google-Smtp-Source: AMrXdXudAWzRSkReGXrlA2k8y1GjMgzJ0Sqz2gL9E0bvitUpLzt30zx7sw5KpOjYmAMpIKholY97galZNRmQhhE4MY4=
X-Received: by 2002:a05:6808:3090:b0:35e:5a1b:825c with SMTP id
 bl16-20020a056808309000b0035e5a1b825cmr2536418oib.155.1672679460249; Mon, 02
 Jan 2023 09:11:00 -0800 (PST)
MIME-Version: 1.0
References: <20221230153554.105856-1-robert.foss@linaro.org>
 <20221230153554.105856-9-robert.foss@linaro.org>
 <deb17787-1a5a-89a3-3ecf-7690b4149f5c@linaro.org>
In-Reply-To: <deb17787-1a5a-89a3-3ecf-7690b4149f5c@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 2 Jan 2023 18:10:49 +0100
Message-ID: <CAG3jFysU84LRcqQOspub+9vtsP3syiksrGX6D7i3ff+X6+mbTA@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 08/11] arm64: dts: qcom: sm8350: Use 2
 interconnect cells
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
Cc: konrad.dybcio@somainline.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, liushixin2@huawei.com,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 quic_vpolimer@quicinc.com, airlied@gmail.com, vinod.koul@linaro.org,
 Jonathan Marek <jonathan@marek.ca>, robdclark@gmail.com,
 quic_khsieh@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, a39.skl@gmail.com,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, loic.poulain@linaro.org, andersson@kernel.org,
 dianders@chromium.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 vkoul@kernel.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 30 Dec 2022 at 17:12, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/12/2022 16:35, Robert Foss wrote:
> > Use two interconnect cells in order to optionally
> > support a path tag.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8350.dtsi | 28 ++++++++++++++--------------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> >
>
> I think you need to rebase to include:
> https://lore.kernel.org/all/167233461761.1099840.5517525898039031248.b4-ty@kernel.org/

Ah, I see. Functionally I seemed to do fine without those commits.

>
> On which tree/revision did you base this?

msm/drm-msm-display-for-6.2

>
> Best regards,
> Krzysztof
>
