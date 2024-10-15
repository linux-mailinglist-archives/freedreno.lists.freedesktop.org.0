Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A4899E9B2
	for <lists+freedreno@lfdr.de>; Tue, 15 Oct 2024 14:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B249A10E094;
	Tue, 15 Oct 2024 12:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hgs0yvle";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DCC10E094
 for <freedreno@lists.freedesktop.org>; Tue, 15 Oct 2024 12:25:45 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6db20e22c85so40016917b3.0
 for <freedreno@lists.freedesktop.org>; Tue, 15 Oct 2024 05:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728995145; x=1729599945; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+Go8RY3f3g+YNRtfmTAreeRvEns8DfLxEuJL0kCvf+w=;
 b=hgs0yvleuTzWDUN8kav2//Duprl/9UJ/5Rx8Kf0VOfNfvojic7FjJFMBTJk0pwysl3
 P4NK07qyEWV9i0shO3abIq0xZUwiiYYxDc9JLGC4kpaSOoQFxq87IHJwTiAgyxijTn4I
 LegG8OitRFDfTFpCNuD32KzDzWzcBgYXPJfxi9jtwC3Qcq7p0YOjutu41zsyHAM+xBMF
 uK+q256OyucF1phHB8kGA0x8MbFNtzszTkqKlOlUcfQlh8eVTOLnMOpBak6aI7UtYg8M
 Zz2ymKPR2rztedil/7RZmf8lvmM4QlTD/JhnSMDls8o52dRdbpGIlwUv4MVGgBJyArOt
 i21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728995145; x=1729599945;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Go8RY3f3g+YNRtfmTAreeRvEns8DfLxEuJL0kCvf+w=;
 b=pVIkMv6U0hHwbafuMAN9JShQCPKSJPMQvMEosNFfMw09ecDTLfKPw52JiB7CJa60mh
 UYTm4d2LFT8ajvJDgUxi4NUpa6tVaqyDT7A7WbcJ88enhIPH+bmYX1d/ZSZWJ2Fx+N75
 MzpdJgTFSwnqxr4GPtm3kKdd3Lcih+MdJTWS1OV9dNph/72SVRONY+GlXuUSxoxTPx2r
 oEcmFdYEQVlcvOxco5usxFAb5pL/rbpyeJvFHAeIoMtODM4vwFxFt5H66kUShbkb8243
 CT5NzGcPji+vZmJg+JHDqWYF2qtkYe+cPJPxXLNJ47Sulei+GTOe+vn2JcINyHb8+CPr
 1zRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURagoep6vE+y6WZMbk7O/Yyj2iXdSkleN+6zq9Z0WuQ6gQLasIDBF4PrQUncanyHo+MFrXbG7+Fuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMdXXGs22G4ehVMQL8ogUY1dORtSfOpU+n5VWz6h5oKe8PZMUp
 w6ThfBtFxOWW2HBLHaTNC0kUZ8qCpB36BdNzcZaCmfw1lShSopxhVgxkBXR2yNV4cUL6mFsinRw
 Ua/Yam0pK8+pGW+GJfyHHx0s00QYjw3BT1ep2dQ==
X-Google-Smtp-Source: AGHT+IHZzOhozWT/zaACpirlbBqkB9AePGlI8+Gi4sFzG1jRzDW+IwnQjZ8DWZzBKqIJX+L8fdHUbM4O+vIm2GvBe4E=
X-Received: by 2002:a05:690c:4c04:b0:6dd:b7e0:65b2 with SMTP id
 00721157ae682-6e3d40d174cmr2743727b3.24.1728995144733; Tue, 15 Oct 2024
 05:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20241004103046.22209-1-quic_mukhopad@quicinc.com>
 <CAA8EJprNz-Byy6T3qkkUyZnTkyb_7osyuevP8E-xYzzPSmQjUw@mail.gmail.com>
 <2a2b1373-6cb4-4813-8736-dd7b12c90c0a@quicinc.com>
In-Reply-To: <2a2b1373-6cb4-4813-8736-dd7b12c90c0a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 15 Oct 2024 15:25:39 +0300
Message-ID: <CAA8EJpoM5d=NgcugVdXfSNDAWp+nfDVV+jaLAqk1pEg7RvoM4g@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add support for DisplayPort on SA8775P platform
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
 andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org, 
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, quic_parellan@quicinc.com, 
 quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, quic_riteshk@quicinc.com, 
 quic_vproddut@quicinc.com
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

On Tue, 15 Oct 2024 at 10:02, Soutrik Mukhopadhyay
<quic_mukhopad@quicinc.com> wrote:
>
>
> On 10/6/2024 8:30 PM, Dmitry Baryshkov wrote:
> > On Fri, 4 Oct 2024 at 12:30, Soutrik Mukhopadhyay
> > <quic_mukhopad@quicinc.com> wrote:
> >> This series adds support for the DisplayPort controller
> >> and eDP PHY v5 found on the Qualcomm SA8775P platform.
> >>
> >> ---
> >> v2: Fixed review comments from Dmitry and Bjorn
> >>          - Made aux_cfg array as const.
> >>          - Reused edp_swing_hbr_rbr and edp_swing_hbr2_hbr3 for v5.
> >>
> >> v3: Fixed review comments from Dmitry, Konrad and Bjorn
> >>          - Used a for loop to write the dp_phy_aux_cfg registers.
> >>          - Pre-defined the aux_cfg size to prevent any magic numbers.
> >>          - Added all the necessary DPTX controllers for this platform.
> >>
> >> v4: Fixed review comments from Dmitry and Krzysztof
> >>          - Updated commit message.
> > For which patches? How?
>
>
> We have removed the "reviewed by" and kept only the "acked by" for patch
> 1. We have updated
>
> the commit message of patch 5 , to mention specifically about the
> validation of 'only' MDSS0 DPTX0 and
>
> DPTX1.

All of this must be a part of the changelog. It's not enough to say
"updated messages" or "fixed comments". At least please let the
reviewers know which patches have changed and which didn't.

>
>
> >
> >> ---
> >>
> >> Soutrik Mukhopadhyay (5):
> >>    dt-bindings: phy: Add eDP PHY compatible for sa8775p
> >>    phy: qcom: edp: Introduce aux_cfg array for version specific aux
> >>      settings
> >>    phy: qcom: edp: Add support for eDP PHY on SA8775P
> >>    dt-bindings: display: msm: dp-controller: document SA8775P compatible
> >>    drm/msm/dp: Add DisplayPort controller for SA8775P
> >>
> >>   .../bindings/display/msm/dp-controller.yaml   |  1 +
> >>   .../devicetree/bindings/phy/qcom,edp-phy.yaml |  1 +
> >>   drivers/gpu/drm/msm/dp/dp_display.c           |  9 +++
> >>   drivers/phy/qualcomm/phy-qcom-edp.c           | 74 +++++++++++++------
> >>   4 files changed, 61 insertions(+), 24 deletions(-)
> >>
> >> --
> >> 2.17.1
> >>
> >



-- 
With best wishes
Dmitry
