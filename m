Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBE99EB458
	for <lists+freedreno@lfdr.de>; Tue, 10 Dec 2024 16:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDAE10E8F9;
	Tue, 10 Dec 2024 15:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W0GXBK16";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809C210E8FB
 for <freedreno@lists.freedesktop.org>; Tue, 10 Dec 2024 15:09:25 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3023c51146cso5322591fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 10 Dec 2024 07:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733843363; x=1734448163; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ONPoAWCr/z6lJfjDFKtgqfFAw1BGCZer+GCPiaXmPhw=;
 b=W0GXBK16LisKO2CNSUVY89xaF3GVq0jl+t1/fOJptjx9oRlFhhaAiTU0kQ3UXMM0MH
 zvzPX2hLOtlSTlSXIsbik/w+qa8WNUoXcRb5AOaIxsuUeXx+oYMOfaY2h1LgMYYSnWQm
 ACw0Ttjpe3Dt59qQR92Khbs0bTBjvN3lXJP4gdJKyQUxpwUJSSIXEny9xO5J+FHcP3e9
 BfpKZidQmM0XI+xJeZ+xE4TvawqTpcHNk7cSnkeTxDYItEkt59srYjGsraodWvei4dwC
 PveaL2Pr26NVyvkQbogfcSuTqDkNmx00jpUJSN9a/ikbE2xVwU+51trvyfA26bde0y0F
 ilZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733843363; x=1734448163;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ONPoAWCr/z6lJfjDFKtgqfFAw1BGCZer+GCPiaXmPhw=;
 b=ir5G/mXGPeahmP1gWudPZcNMieoTm44ciWGNxXth4Lh2ciGwSsQlfMR9ss7r+Sh67e
 62S8uzcQ9JBct0b/9xH5IgHrH1mKRpR+9WqDqQAC1e76rn253NM20C3lQ8x2CvJdAhQt
 KrtZhOlXRiOr/ITzVDrZN39odk0TU2/3T4nOhU9yUmiPxnoq92ZX/fUgzrp2Y0927s7E
 QK3NTgDfejunAiNREcjFpf3FDqZ3p7M/0lpQewECgD9nEh+kFGA7ZD9dloRBs/ZAOKbB
 LHj09fMIhpB+IqZ24Mj8912W27/Rb992mwr9mmiX5SboQy+6OQxGHMM9qhCvSAMHASuY
 9RIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3nzqz/a+/8HNYWvH3uEgGcQY3ZMR1LBndH7x4qSBWJmNIRT98SURn2w2E9PDidxF2bt/B72sZBZk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYMdFDYvfzyBXmfF0qqxdy9K3/p+tpzTTs7SvtPpUdRhu/kql1
 c8THQPZHXy8Mx85QOyABD5S+CLUOiKDEQoAtY+nU5w/UiQs3jChK9lyoImwZyNc=
X-Gm-Gg: ASbGncsrFl3fJ+NDHCikhQUzvmH0tcQmm/xNjoEZ2Kdpw8KbvTGcfjU/vsNdewqW6od
 vr0wHdoYiVBmhRNDfNCmXqMoJmqfvIQchu95a88E6H5hNJu+83xwF9gtuzT/5QQ38M5sOtwLCCP
 5BLXrzTSaKCZFdv/PgnGa3ULv/akeQwx7VBbzbx57aekFeu4rxs6qRN21D936U4AP2oS4d6njjI
 QndfX4NRolfvbQLF7e5b5MSNCoqZP/DULq9PNCTEFJR23cadRpFW0zQdGb0EGSRncCDgURG6s9j
 ZCeFcp60T4DMNlHlXw1K577HTTL0U5xQSQ==
X-Google-Smtp-Source: AGHT+IH4LG5o5SbyEh1Vovj71WLwSfFbBGhk7NJh/k58qLpSj2p2TBBGrOFSDDq9rnPlmsaGShNmLg==
X-Received: by 2002:a2e:be0b:0:b0:2ff:b8f5:5a17 with SMTP id
 38308e7fff4ca-3023282c1femr12568441fa.5.1733843363188; 
 Tue, 10 Dec 2024 07:09:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-302259416c5sm5907321fa.6.2024.12.10.07.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 07:09:22 -0800 (PST)
Date: Tue, 10 Dec 2024 17:09:21 +0200
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
Message-ID: <iqcofcntirmlwcpyfr4yabymqfcgyrij57bibf337tmxpa73t6@npkt6wquenf6>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
 <CAA8EJppOR_UXoVpMt-dhfWdCz3UNfsXGdz8X9NqpaSmYj3AZDg@mail.gmail.com>
 <5ea14162-567b-462d-be02-b73b954b7507@quicinc.com>
 <5whv4z7u6fkfwlv5muox5dmv6fow4mga76ammapw7wph7vwv3f@xibcjdfqorgf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5whv4z7u6fkfwlv5muox5dmv6fow4mga76ammapw7wph7vwv3f@xibcjdfqorgf>
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

On Thu, Dec 05, 2024 at 08:31:24PM +0200, Dmitry Baryshkov wrote:
> On Thu, Dec 05, 2024 at 09:26:47PM +0800, Xiangxu Yin wrote:
> > 
> > 
> > On 11/29/2024 10:33 PM, Dmitry Baryshkov wrote:
> > > On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> > >>
> > >> Extended DP support for QCS615 USB or DP phy. Differentiated between
> > >> USBC and DP PHY using the match table’s type, dynamically generating
> > >> different types of cfg and layout attributes during initialization based
> > >> on this type. Static variables are stored in cfg, while parsed values
> > >> are organized into the layout structure.
> > > 
> > > We didn't have an understanding / conclusion whether
> > > qcom,usb-ssphy-qmp-usb3-or-dp PHYs are actually a single device / PHY
> > > or two PHYs being placed next to each other. Could you please start
> > > your commit message by explaining it? Or even better, make that a part
> > > of the cover letter for a new series touching just the USBC PHY
> > > driver. DP changes don't have anything in common with the PHY changes,
> > > so you can split the series into two.
> > > 
> > Before implement DP extension, we have discussed with abhinav and krishna about whether use combo, usbc or separate phy.
> 
> What is "DP extension"?
> 
> > 
> > We identified that DP and USB share some common controls for phy_mode and orientation.
> > Specifically, 'TCSR_USB3_0_DP_PHYMODE' controls who must use the lanes - USB or DP,
> > while PERIPH_SS_USB0_USB3PHY_PCS_MISC_TYPEC_CTRL controls the orientation.
> > It would be more efficient for a single driver to manage these controls. 
> 
> The question is about the hardware, not about the driver.
> 
> > Additionally, this PHY does not support Alt Mode, and the two control registers are located in separate address spaces. 
> > Therefore, even though the orientation for DP on this platform is always normal and connected to the video output board, 
> > we still decided to base it on the USBC extension.
> 
> Could you please clarify, do usb3-or-dp PHYs support DP-over-USB-C? I
> thought that usbc-or-dp platforms support that, but they don't
> support DP+USB pin configuration. Note, the question is broader than
> just QCS615, it covers the PHY type itself.
> 
> Also, is TCSR configuration read/write or read-only? Are we supposed to
> set the register from OS or are we supposed to read it and thus detemine
> the PHY mode?

Any updates on these two topics?

-- 
With best wishes
Dmitry
