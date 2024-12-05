Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7C39E53FE
	for <lists+freedreno@lfdr.de>; Thu,  5 Dec 2024 12:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69F710E3B5;
	Thu,  5 Dec 2024 11:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iHrkR1uK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F0610E3B5
 for <freedreno@lists.freedesktop.org>; Thu,  5 Dec 2024 11:32:26 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e3990bbe22cso948446276.1
 for <freedreno@lists.freedesktop.org>; Thu, 05 Dec 2024 03:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733398345; x=1734003145; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G5K+z1ONa1RR9Z9IC6HhDI8iNZ342Y9IqNJaDLuBurM=;
 b=iHrkR1uK/qYegrkbxVbqLDZOjI8FmkbaVbnV+Mx2vagalhzru2hqhdo9gwBnfdR0tp
 Q1WbSt48eB+wmDaUBaEFuKJJztUjBPOogr/MTpw78uMd7StE66Hy4iGGLYuOKHZpw1Bk
 C3VkjywlylFsNLKNMjru7O8pDBqJQ8LVn4oS5Lid44zNo3UOxmf+yAzs0BNBx+XJ+YQ1
 vbGpigoZFPZshU+AwFVqiWcxF/aktTNm6gFad6/+oE0ISdFmP+HQFcWdaHeZa0Z4hLlS
 XOr+0w69hZoiXN5pmEkkSMQwF0lVLoNmWnWHlQdEPOo+l1C1GbeEE7CpUoLoBL3W4YGc
 xwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733398345; x=1734003145;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G5K+z1ONa1RR9Z9IC6HhDI8iNZ342Y9IqNJaDLuBurM=;
 b=edh/OZk7iGRSRsH0tdWaw51IkYQZF48ALusF3Sa1a171Q4kLlppWJ6gn0eC0FmEUx6
 JNyadsWhzsgShJFVF3m73+JJ6MgGBvYyUHIR7YYG7wMNs7epUh3ddbvCGqE495Bpza+M
 iHzyTOR6MsxmK3Kdjr/dG06mW7+XC+CcRz/NeXyo5fPczehBWYnogv54EXkyWF6NQwCM
 YioelMMN78jdzdNIfAoQIsJCW3YI346Dv2dwlqClVdR6gIpnn1Sjp/rJpnIJ7Fsh2J+c
 QL8iE2UXDD34GXE4LrttYv+sYtL/3OqfGRzBRDH0rbekx70UzxityiY6a+JwkAB4uaJf
 fdFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ8DFckxDP0P/Df3SN+MV09/hp2+zpgtiRE5FKWjXDBDY2wQieFIJXk1Mr+xjBcZMlcY0qWArVCgI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywpr9/EHx8GzST3gU3tINZ2VU+HYon/KHUegbbD4MU44Y6W7TmS
 Mrs4/ZScmphkYMDv87pyIAoMH/fHYvw7uLT0rC5w2ae0w2f8HlLtYZL6xAG4fw18FWedTp48RMP
 PoRtVZ5jj2pub4THeAt0gzcanoDnZEP4n8iAFLA==
X-Gm-Gg: ASbGncsiWpqRG7o8BvWPUGZZdP6+FeJfkqlPIJ83R3fvh1XGAgMtQxhDtY9bQK5SWFb
 E9/bY3JT4ILsIIS0YL6b/4tT2HF9S9TmKgklNvmFpvGplGw==
X-Google-Smtp-Source: AGHT+IHjmMNzBozE1BA+ZpJB22O/URDVrP1u0WuP4Fn3l0waUtFl3sNfAQKJTRUadOC35vLb1W/MstA1KNP3iqlfMnA=
X-Received: by 2002:a05:6902:2688:b0:e39:b357:cb15 with SMTP id
 3f1490d57ef6-e39d3a279demr10425188276.16.1733398345153; Thu, 05 Dec 2024
 03:32:25 -0800 (PST)
MIME-Version: 1.0
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-2-9a9a43b0624a@quicinc.com>
 <bfa857c2-cd74-4fe2-a88c-3b35a58710b0@kernel.org>
 <gpqrugcsyhz32bvip5mgjtcservhral2o5b6c5nz4ocwbjw5uo@eypv4x6jyrdr>
 <hqe2pipkcnxftoq5mvdk36xmkj3ybr3oto6eghimq75rqlncsm@v45smglhedy7>
 <pxi2nf4h34xtkickkkuwh4svvhbtsutuz5u3ukzgfgd5rzzcps@g4gct5zuc6kj>
 <2ef59c6d-bef2-4763-9463-06116a2e7d04@kernel.org>
In-Reply-To: <2ef59c6d-bef2-4763-9463-06116a2e7d04@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 Dec 2024 13:32:13 +0200
Message-ID: <CAA8EJpotUkPWU4VTmtaH=XkhwPZVXfdU8ZyHqROYpZRWDdYPSQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: display: msm: dp-controller: document
 clock parents better
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Mahadevan <quic_mahap@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Thu, 5 Dec 2024 at 09:33, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 04/12/2024 11:09, Dmitry Baryshkov wrote:
> > On Wed, Dec 04, 2024 at 09:02:18AM +0100, Krzysztof Kozlowski wrote:
> >> On Tue, Dec 03, 2024 at 03:41:48PM +0200, Dmitry Baryshkov wrote:
> >>> On Tue, Dec 03, 2024 at 09:01:31AM +0100, Krzysztof Kozlowski wrote:
> >>>> On 03/12/2024 04:31, Abhinav Kumar wrote:
> >>>>> Document the assigned-clock-parents better for the DP controller node
> >>>>> to indicate its functionality better.
> >>>>
> >>>>
> >>>> You change the clocks entirely, not "document". I would say that's an
> >>>> ABI break if it really is a Linux requirement. You could avoid any
> >>>> problems by just dropping the property from binding.
> >>>
> >>> But if you take a look at the existing usage, the proposed change
> >>> matches the behaviour. So, I'd say, it's really a change that makes
> >>> documentation follow the actual hardware.
> >>
> >> First, this should be in the commit msg, instead of "document better to
> >> indicate functionality better".
> >>
> >> Second, what is the point of documenting it in the first place if you
> >> can change it and changing has no impact? So maybe just drop?
> >
> > So, do you suggest setting both of the property descriptions to true? Or
> > dropping them completely and using unevaluatedProperties instead of
> > additionalProperties?
> >
>
> Dropping them entirely, without any changes of additionalProperties.
> Unless this property was added due to limitation of dtschema?

I  don't remember at this point. I think it's worth trying to drop them.

-- 
With best wishes
Dmitry
