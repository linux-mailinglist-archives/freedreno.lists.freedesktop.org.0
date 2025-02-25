Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768B5A43372
	for <lists+freedreno@lfdr.de>; Tue, 25 Feb 2025 04:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2A110E533;
	Tue, 25 Feb 2025 03:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a1nbdaWA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84FB10E533
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 03:14:48 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e4930eca0d4so3688263276.3
 for <freedreno@lists.freedesktop.org>; Mon, 24 Feb 2025 19:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740453288; x=1741058088; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IQVbEzx9kvB0TrPeedrtx7i8ImP/tXHPwCaZo2eyYPM=;
 b=a1nbdaWACJYh/YDrb4ekbhDGU+4I8fmGd0qVqc4RtPbXHN2DvmQKMCqHki/UvwOyqh
 TLWNvPoZLwUtoFeoN7DGC85wXK66tERGNVpjpKTJhIKYdY0+3gPMwSzCfpgvx6IVZ/Wn
 QgRlW5yCoCTyOHJ2L2Efkghey5BxAAVl8mE6uMcEPN8NXZcjJou9izOjUAlOU3U9cGOA
 WGh7UHbB4H+MjeG4vY71CJWUU1KyKtb8y4Za6mmRbFxTpU65p4X6EuM5r6dUw4OsXUrZ
 A71wcH372htrFO1CSQbkKpDFWxAKAaVdccM9DUFf3RD5cH6FrqyCBD5OY8oOefSKx0hd
 Ac7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740453288; x=1741058088;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IQVbEzx9kvB0TrPeedrtx7i8ImP/tXHPwCaZo2eyYPM=;
 b=CQCn/5eqqhgcxa1v+6TFKJyTJbSN141aQK+KRGG0j6Cgn7Dx1JDl8tGubULn6nco8/
 lcl0yp8VjcEZ7E+2q9urJmfOpJDs8/0ZwcaigoZXVRAMB4rTBPej6UrnTGzyRM4fVWt0
 i8SHwyHj3gGAWHnBLRU6bEOYFH7z23KLaU15mcNtUUYSPqjk0e385dS1fXsLV2EFJYo6
 6kTw0TgalwBlPAe1fmcjTwGh5L5AbXMvhg57I3Sjy5pL/vqNRQt3sXaM9Gtmh2u+KOYw
 6/QbBENiIiCLTYtubFTAqdxUbmSzizEoc9a178PBUNETtQPKzf4Rla6xQ32kYyeFD09A
 WF9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlz8kJFKtkrygjVvERTJuq6XJHhKfJrD5/AouMuq4qoUZtVSITOd8soCysqb+7jZzLlReIq0P4zFA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGHllcAw60fS39BS9NvwNsQu9P/G3OP2ulPcmkSlkedtbLDkMH
 NB07y01/rihNj4O6gkrcpwUCe046Nykk48u2p/yP0wlD2+NYeSRlQPbKvnDwpX1H5rJRTzysCVd
 5Vsjy3Acy0XcPr/7fg80VIuJi5WwOmLk66JpOxA==
X-Gm-Gg: ASbGncuH8FXKxWa8GSJpeaJDrn7cRPt09nls5rYqLXNp1DtTxztJLaUEHv0ppHgAuNe
 nxRLw4HgY4zOTUdQO4R8iYLG1svnJPpu2dO+pMHFRkMYsnc6m91xc3211QL7fYIs3CxSIA34YB6
 6kzUfa7L3U
X-Google-Smtp-Source: AGHT+IHc41JPGJ088b37b3aIhRMn8lVQtQIt1tmL70qMB6qKKdFyKRe9bfOCM8ADQNOIRUFDSenHC0fF71QDngeKPHY=
X-Received: by 2002:a05:6902:2e82:b0:e5d:d016:989e with SMTP id
 3f1490d57ef6-e5e246719d8mr13282250276.39.1740453287851; Mon, 24 Feb 2025
 19:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-5-d201dcdda6a4@linaro.org>
 <aqpuik4zitdfuk4pahn4wyzxdvxldy4dcqjs3mhr6fqtxpoxhf@ssfzzbfce2nu>
 <2dfe466c-ad94-4683-a2e9-a49e77a61f4f@linaro.org>
 <h2shpen65r7v4in54avsez7qtlwojbt2cthyomqrsgs5ewprwb@bn53suqrzkac>
 <4e82404a-0ea5-4641-829a-bba666edd352@quicinc.com>
In-Reply-To: <4e82404a-0ea5-4641-829a-bba666edd352@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Feb 2025 05:14:36 +0200
X-Gm-Features: AWEUYZmkKWazMeNY444Pg0IY6jEqBfAoPZAv6AXrcyFb_NB6yz312AR5esudyLk
Message-ID: <CAA8EJpoWEuqKkreUTu1gO-Pr=VFNNP_vBfNZpitJiJH728vjPA@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] dt-bindings: display/msm: dp-controller: Add
 SM8750
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
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

On Mon, 24 Feb 2025 at 20:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/19/2025 9:08 AM, Dmitry Baryshkov wrote:
> > On Wed, Feb 19, 2025 at 06:02:20PM +0100, Krzysztof Kozlowski wrote:
> >> On 17/02/2025 19:58, Dmitry Baryshkov wrote:
> >>> On Mon, Feb 17, 2025 at 05:41:26PM +0100, Krzysztof Kozlowski wrote:
> >>>> Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
> >>>> fully compatible with earlier SM8650 variant.
> >>>
> >>> As that became a question for QCS8300, does SM8750 also support exactly
> >>> two MST streams?
> >>
> >> v1.5 of DP (starting from SA8775p , then SM8650 and SM8750) support 4x
> >> MST for DPTX0 and 2x MST for DPTX1.
> >>
> >> The DP in SM8650 and SM8750 are identical, according to datasheet (v1.5.1).
> >
> > Hmm. This also means that QCS8300 is compatible with SM8650. I'll let
> > Abhinav comment here.
> >
>
> DP version by itself is not a good measure of whether the controller can
> support 4 streams or not.
>
> Firstly, sm8650/sm8750 do not have a DPTX1 so we are only discussing
> about DP TX0.
>
> Coming to the QCS8300 Vs sm8650/sm8750, even though the DP controller
> version is the same, there is no HW support for more than 2 streams on
> sm8650/sm8750 because there are no INTF blocks to drive 4 streams.
>
> On sm8650/sm8750, only INTF_0 and INTF_3 can be used for DP. Hence 2
> streams.
>
> Whereas on Monaco, we have INTF_0, INTF_3, INTF_6 and INTF_7 capable of

No idea what Monaco is, most likely it is some platform. Please use
SoC names in public.

> driving DP. Hence 4 streams.
>
> Let me know if there are more questions.

How many stream clocks are present on those platforms? I'm asking
because there is a small, but not non-existing difference between 'DPs
are not completely compatible / the same' and 'DPs are fully
compatible but different DPU blocks impose different restrictions on
the number of MST streams'.

-- 
With best wishes
Dmitry
