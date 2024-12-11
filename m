Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB28B9EC997
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 10:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F29410E130;
	Wed, 11 Dec 2024 09:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ATPw4TUv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1D610EAD7
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 09:46:09 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-540215984f0so2800353e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 01:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733910367; x=1734515167; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tea4vIJiGPJWHixoiDd5FPFnMHQTgOFRwTGQIe3zrGg=;
 b=ATPw4TUv5jkI34MUgcIVLfUbwR3sCkhh7Em9iyHf48yuu7CoMXP70E8Aq6XWs0CEfF
 J4LJFKiTgdNsis4VOSxIRJ1mUOT3Ka0GycpQvbvS7jSbcxcP2wfWxR22njtOxexg1K8K
 r7qmXJu5LhvhbLSVxrvn35AnVWA508F8Tzh4d7LPDqrUIX7BoYtsXyOV5Orn+vPVFCNg
 fdElFSPGZ0xZgCiZipg86PzQQYFkW2ydW3EYCSrn8KYPlq4EEiEF/iAjb5ASUFn8FuDw
 yS9f1nCC/7nHLnaduozAi1e7BPzcH3M3abTd/UFYD79vUIDl3yE95aSEprMIjv3N5Dsd
 erPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733910367; x=1734515167;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tea4vIJiGPJWHixoiDd5FPFnMHQTgOFRwTGQIe3zrGg=;
 b=Bu7TPFC013UJjWwPywBLAXdSJpYbYs3bRuXCNYFRVfDsC8ow6kuUCBSC1guinJrKaH
 Tf1GbxkCzqyzo2NNP4ikTHYgVbDtJsdBL7TAcTIaYmznWHMtXXb4gDZzNxxfnLJdpWj8
 24FtzTImdoBYrT5wOrzX/0/0qBK0QKM+nGbztHZQ10lLCSP4hT00ehBHqVx8WeMx6SHn
 47ovKKU5jYDc4Ym9I4fh2CB9g8r62LwNtVXO9IbW+LENJ3gV2il3XqHCwPgfBIdrfPqN
 2wnFjeJ2MOsz4eU/lbAl9Tw25yX2UVHkcAMwUCVZv1gM3i5/3soky95CnOFB52ZIxqJh
 LqQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo9VNa1Hd904w3R/SdHm2OYuM7kre0A3OkiVgGfCxNlyVDEoVk1oe0dOfdi3IEhIrPfqH+CJMWXQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxqbuh/67695yrdHwBrj9FEm1zSyGEE8OuTfWd2s5wNuGV0yje1
 gUkdZ2+ZofRJ1T9jg13iI/FVZmm3NoBmjfgqzoOVhsNmbepdHqGZ00ZvC6ARut8=
X-Gm-Gg: ASbGncstxXCcUyWS8wHIuwOJd4xh5nFd0fcFr8/UHQf57b3NgbxSZG0OmDEVKfdA2mi
 zzLaCC+p/G2grjCQqHr0kmiaHqye7w3/OeNuNRrogFDRcBJBt9gpUUpjlGUrn5HBAk3/uLBzEKT
 RXHAP0keB5Bchv4aEch4f7AcE8sBXT+3FEA+0Ynu9Q7+yVJUxbYNwh7G8gy9wXUv+5qCgaM62jf
 wYDq2YcquwgczaVhl91/f76diqpw68KHWE+WHqtLUchWryK55UT+TQRIDp90HqmMB6hjLHSxaOq
 RQivV3jviwhB+6vIePZYsWt0+OxgsdClEg==
X-Google-Smtp-Source: AGHT+IEtlbI01qtT4hElvvQMyeb/TKdaC5qWfnqkdfHb5ztyN2VBFJ9f2yMWhkC3MvVYmq106RrFMw==
X-Received: by 2002:a05:6512:3c85:b0:53e:1c3e:34 with SMTP id
 2adb3069b0e04-5402a6056a1mr671998e87.38.1733910367530; 
 Wed, 11 Dec 2024 01:46:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e22974f2bsm1973804e87.99.2024.12.11.01.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 01:46:06 -0800 (PST)
Date: Wed, 11 Dec 2024 11:46:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on QCS615
Message-ID: <t5vcjlf44fhae4f2h75cfs3f7r6tdstw4ysmkapvvawj6xp23x@xnxqnxvyhshe>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
 <CAA8EJppOR_UXoVpMt-dhfWdCz3UNfsXGdz8X9NqpaSmYj3AZDg@mail.gmail.com>
 <5ea14162-567b-462d-be02-b73b954b7507@quicinc.com>
 <5whv4z7u6fkfwlv5muox5dmv6fow4mga76ammapw7wph7vwv3f@xibcjdfqorgf>
 <iqcofcntirmlwcpyfr4yabymqfcgyrij57bibf337tmxpa73t6@npkt6wquenf6>
 <527baded-f348-48a8-81cd-3f84c0ff1077@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <527baded-f348-48a8-81cd-3f84c0ff1077@quicinc.com>
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

On Wed, Dec 11, 2024 at 08:46:16AM +0800, Xiangxu Yin wrote:
> 
> 
> On 12/10/2024 11:09 PM, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:31:24PM +0200, Dmitry Baryshkov wrote:
> >> On Thu, Dec 05, 2024 at 09:26:47PM +0800, Xiangxu Yin wrote:
> >>>
> >>>
> >>> On 11/29/2024 10:33 PM, Dmitry Baryshkov wrote:
> >>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>>>>
> >>>>> Extended DP support for QCS615 USB or DP phy. Differentiated between
> >>>>> USBC and DP PHY using the match table’s type, dynamically generating
> >>>>> different types of cfg and layout attributes during initialization based
> >>>>> on this type. Static variables are stored in cfg, while parsed values
> >>>>> are organized into the layout structure.
> >>>>
> >>>> We didn't have an understanding / conclusion whether
> >>>> qcom,usb-ssphy-qmp-usb3-or-dp PHYs are actually a single device / PHY
> >>>> or two PHYs being placed next to each other. Could you please start
> >>>> your commit message by explaining it? Or even better, make that a part
> >>>> of the cover letter for a new series touching just the USBC PHY
> >>>> driver. DP changes don't have anything in common with the PHY changes,
> >>>> so you can split the series into two.
> >>>>
> >>> Before implement DP extension, we have discussed with abhinav and krishna about whether use combo, usbc or separate phy.
> >>
> >> What is "DP extension"?
> >>
> I'm sorry confusion casued by my description. It's means extend DP implemnt for USBC phy driver.
> >>>
> >>> We identified that DP and USB share some common controls for phy_mode and orientation.
> >>> Specifically, 'TCSR_USB3_0_DP_PHYMODE' controls who must use the lanes - USB or DP,
> >>> while PERIPH_SS_USB0_USB3PHY_PCS_MISC_TYPEC_CTRL controls the orientation.
> >>> It would be more efficient for a single driver to manage these controls. 
> >>
> >> The question is about the hardware, not about the driver.
> >>
> >>> Additionally, this PHY does not support Alt Mode, and the two control registers are located in separate address spaces. 
> >>> Therefore, even though the orientation for DP on this platform is always normal and connected to the video output board, 
> >>> we still decided to base it on the USBC extension.
> >>
> >> Could you please clarify, do usb3-or-dp PHYs support DP-over-USB-C? I
> >> thought that usbc-or-dp platforms support that, but they don't
> >> support DP+USB pin configuration. Note, the question is broader than
> >> just QCS615, it covers the PHY type itself.
> >>
> >> Also, is TCSR configuration read/write or read-only? Are we supposed to
> >> set the register from OS or are we supposed to read it and thus detemine
> >> the PHY mode?
> > 
> > Any updates on these two topics?
> > 
> Still confirming detail info with HW & design team.
> I’ll update the information that has been confirmed so far.
> This phy support DP-over-USB-C,but it's not support alt-mode which 2 lane work for DP, other 2 lane work for USB.
> TCSR phy mode is read/write reg and we can read for determine phy mode.

Ok, thanks for the explanation. From my point of view:

- Implement the DP PHY to be a part of the same driver. Each device
  supported by the usbc driver should get both PHYs.

- Make sure not to break the ABI: #phy-cells = <0> should still work and
  return USB PHY, keeping backwards compatibility. Newer devices or
  upgraded DT for old devices should return USB PHY for <... 0> and DP
  PHY for <... 1>.

- I'm not shure how to handle the USB and DP coexistence, especially in
  your case of the USB-or-DP PHY.

-- 
With best wishes
Dmitry
