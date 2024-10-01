Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B1398BF87
	for <lists+freedreno@lfdr.de>; Tue,  1 Oct 2024 16:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C6810E637;
	Tue,  1 Oct 2024 14:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="doOfP70C";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C888A10E634
 for <freedreno@lists.freedesktop.org>; Tue,  1 Oct 2024 14:17:01 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a90188ae58eso712188166b.1
 for <freedreno@lists.freedesktop.org>; Tue, 01 Oct 2024 07:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727792220; x=1728397020; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MvAacLaDBceNrpSd1jDzbEXuHGqrT8pU1AHDnl3+2N0=;
 b=doOfP70C74sHI3iBIN6J7XjEVJFBJS1MoEkiaBa4POOwWOViIdacLIzJ5ocyIa6eQS
 rsqIl+X1Ve3tZ+OzWDjgxYrcx6biUJQAHI2kDcn8Jbs3M0VC+ntTvxanU3ajf62UnVmh
 zSt0kWplKDB7KWugtmeJxITNEXwoDmrn81nRp035DaulBzyEH0a9hnY2hy4FXxb0r7g9
 fCNGXdJC24/JLgc0v21nO67gFRHXVToc7WmsQX9grOMYQFHMZSj0a1mLSeUt8bvz1uF1
 BJQqVRn2b4PZiFQ8Iigdj8i8EUj4OzDJu5RXJKdD9UplnnmUGW+56duDbGkF++fqmpA/
 eW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727792220; x=1728397020;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MvAacLaDBceNrpSd1jDzbEXuHGqrT8pU1AHDnl3+2N0=;
 b=CMMKZTwhwALJuMjOulKNYT+DmobQrvRbiyvRwZopfCc8JLxMTnPliL2FLWHseCOqAu
 ANLgoVLqZWeYuF4djBSP6B+VSRhIxb5i1Qg2fOYca5pexsHsoIANms4RWXqZ4UmkJyl+
 O5h1ZnY/sS75WxNOuGrXDQiL9qHQmh1c2O7nj2dvlLQEDWjaV6pzI9dIdc3+YgbnVpDz
 2TC7IOEqIkUH76n2VTaWLroblDrcm+3rFNKu3FCReazLzWzeaMCGhfR9CgkeFQv4TIcl
 56zelJPxLnbOEOfKr30AYDcGj0kfF2MpuIXVAZyHtHdJS/rTocUnP97Oun3zK7YwEDjg
 +wTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAVnF/XX6csrl9Uc4TcWLTP93L1VgzJ1KTo7jPEuslDgqoCJeZiBYelCzsq16eo8X5yncH8q15cio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwFfgBoxk/ncWeE5odAIr7HvbDQ2Bcrl5LZys73AE/juVB7JKq
 xKPQh2Kkx8bbldYw19DyOpKZGtzakLqcw0cCB7Uq4a4BkUIIaZ8QzJW6pC+GdnA=
X-Google-Smtp-Source: AGHT+IFEWffX/CHGY6XoMdO9kdp7HM2GYhPbJlSBDdG8O1hxbquzBTDo/fLcnh7exBe/tUwFPn8yXw==
X-Received: by 2002:a17:906:db04:b0:a8a:18f9:269f with SMTP id
 a640c23a62f3a-a93c4c267dfmr1736758766b.60.1727792220071; 
 Tue, 01 Oct 2024 07:17:00 -0700 (PDT)
Received: from [127.0.0.1] ([37.155.79.147]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2947487sm719545766b.139.2024.10.01.07.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 07:16:59 -0700 (PDT)
Date: Tue, 01 Oct 2024 17:16:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, quic_mahap@quicinc.com,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Kalyan Thota <quic_kalyant@quicinc.com>,
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_0/5=5D_Display_enablement?=
 =?US-ASCII?Q?_changes_for_Qualcomm_SA8775P_platform?=
User-Agent: K-9 Mail for Android
In-Reply-To: <609440b4-e46b-44c6-ba33-c30f4ca8d863@kernel.org>
References: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
 <609440b4-e46b-44c6-ba33-c30f4ca8d863@kernel.org>
Message-ID: <576B115A-CB36-4795-BF23-75EACD0679E5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On October 1, 2024 1:16:31 PM GMT+03:00, Krzysztof Kozlowski <krzk@kernel=
=2Eorg> wrote:
>On 01/10/2024 08:41, Mahadevan via B4 Relay wrote:
>> This series introduces support to enable the Mobile Display Subsystem (=
MDSS)
>> and Display Processing Unit (DPU) for the Qualcomm SA8775P target=2E It
>> includes the addition of the hardware catalog, compatible string,
>> relevant device tree changes, and their YAML bindings=2E
>>=20
>> ---
>> In this series PATCH 5: "arm64: dts: qcom: sa8775p: add display dt node=
s for MDSS0 and DPU"
>> depends on the clock enablement change:
>> https://lore=2Ekernel=2Eorg/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0ce=
f@quicinc=2Ecom/
>>=20
>
>b4 diff fails=2E b4 mbox + b4 diff -m also fail=2E Way to make reviewers
>life more difficult than it should be=2E
>
>I'll move this patchset to the bottom of the queue=2E Please in the futur=
e
>send patches in standard way, so our tools can handle it easily=2E

This is the first time I read that using b4 tool is a strong requirement=
=2E This iteration has been sent using b4, previous, probably, were not=2E=
=20


>
>Best regards,
>Krzysztof
>


--=20
With best wishes
Dmitry
