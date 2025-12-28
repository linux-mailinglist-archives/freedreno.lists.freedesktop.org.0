Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C48CE5192
	for <lists+freedreno@lfdr.de>; Sun, 28 Dec 2025 15:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8594610E210;
	Sun, 28 Dec 2025 14:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WS4Y8wXn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z58PNilH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7483510F70D
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 14:59:23 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSEv1cp3119130
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 14:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=ckxl8AmlS8qqEoOlTPxy53fO7iguWQqxjRQ0V+pR5ko=; b=WS
 4Y8wXnFQjcrsG6h1hNWhN7x9D/HFQXjgxW9sS0VHQOZdZBf8YmEVt/ZSeH8J1jXm
 lkCDTbCvL8G7XosiCr73qeFXehsNK4qLlEEgvhyjBw6icsITpkPgZiaa/gwAJuG7
 CmSiuShCsuwcodHrjSSx/ONUOPwHysMwIpbNHG4ArjF2hGv2zZjkdXNr5vd2W9CQ
 CDrvjjJW6Cx1ihfj1ZFEAs1qAz/DpnhPd+p4tV+5oXKZZhD2CX9jBQ9xkghw6Bmm
 jWf38G17eXOEV9Rtf6T/tKsfju/rtUa2PM7DoS/oZwXrD1esCu8zXugz+TVBBThl
 cjwGqOHa5Z1m4s8vJhNw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87bta0w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 14:59:22 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-450178eaf86so6957949b6e.0
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 06:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766933962; x=1767538762;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ckxl8AmlS8qqEoOlTPxy53fO7iguWQqxjRQ0V+pR5ko=;
 b=Z58PNilHMXHpQm2VTctg/ffZ5dC3m9KMnKxxu+T+KyRLBRBLP/YZAwoeGXFJ4YUzM2
 R8nmi5YVYkI2C+6gfzDSV32Qq6ZBKkZXOEES4VtcBrTlzT1igpHB8nZhGCCFI8aw17Di
 G8U5GMlKF4qr45lQLsejZlzeDPM8SYTBDq08xG25Wp/JNBLFXx/7xzEwBV5p4yQ7b5wW
 nHntUUulBJ4OXPWx3usgzdo6RvvFBqmMdv+w9ibC7E2OKIEbXMlRwEwgbYHjS13S8kdI
 tKE3Annxa1PFoECjArU7V6+J56lwd1TegWevvLwjaV2QCtpmbeQ8rVTKSPgwL6LEKfvj
 U7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766933962; x=1767538762;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ckxl8AmlS8qqEoOlTPxy53fO7iguWQqxjRQ0V+pR5ko=;
 b=AUV/Pen1j8cQ0z5NXGDrFgAm8zpy0ifqDR9ifgVY6JnQwQiUjPf4pOuGi/EgcApldb
 x0u2BnKduVmJlViqNmu413qEgGYH68gXemSew/5KlFhrEfKCXoTAgzSzME40Ko7L/gIH
 e2UHRrwqCPsR1XmLJNPyA6Mm+r22ndqB3FVUnm3Ju3Oiju7CS9ddDY6jc92X1UAVt3wN
 dt6hPODnWtrC7f5XuW5sAlVSeHHGYUFbJMJrxaKyPtkBnwSLYl3ucLYEFZEug+3VzaTT
 IEThkmiFwDS1eBa7qczn+Rf1C8fZ9x7H4VR/g22t/H0ggUPAvX1X/PrTB78nC2IoSFce
 4sZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsBcDvjQmQB/b3Q59smTdNRBpj431dz6RB8gPYOobJXJWT1/ClBdbri6WHbAuI7IQ13MXtVTS+Mog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3qmebiWkmevdv3qDUordvxOTTlTGf0TlRmxUeqP1tDYvHFVyK
 /WTifkC/Kfv4Tjbyuozfitn+RjkYt4xQ+FZ/y62IwbAnI9TPN1HyR0w9LFZ2pgEePn4Am2dj4oc
 McEqVQ9g8sJ5HqyIAfYaO2zpew5/c8yTXkJSKEqCQyYKAMIwk73oXH7T6fLYcicc7V5pUr2qQH4
 xtFtiKm5Q3IMK1mzkZQil+aVFY0QeOoMoCWfQyFQ3GUM3Uaw==
X-Gm-Gg: AY/fxX6eU3fkIWjUO53twlhGwMm20hUlsYL89G/V1A8OvJSPUsTKbWoBNCj6Matz7q+
 adkHuK7ix4vibm9yKmthIs6RICb8A7q7bqKHXbLWHZ70OBgTX3uerQSJXF66McPBkCe2K5x4b0B
 QxV/5lcxdd8e+v2mAOpsnKgXRg/JuhStSAoz46laThCDZvY2eA0+RbHI9kptxuY6x4
X-Received: by 2002:a05:6808:1242:b0:450:ca65:ef63 with SMTP id
 5614622812f47-457b2149dbdmr12232128b6e.24.1766933962036; 
 Sun, 28 Dec 2025 06:59:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKQ0W8E5GFXYVpsjWfkLEr/ZyGiqCM3SgXbbT2E0YVGU5DGNlnBmjzQkxsGSiAPl47E7aHxd/AkB230yEoieg=
X-Received: by 2002:a05:6808:1242:b0:450:ca65:ef63 with SMTP id
 5614622812f47-457b2149dbdmr12232107b6e.24.1766933961622; Sun, 28 Dec 2025
 06:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
 <CACSVV03H_oii=fuhaeBhUZSJk-2mr08jGqAs30Z_h9tzeDgdtw@mail.gmail.com>
 <2a35d31a-1a3e-4cd4-ac3a-27104ff12801@kernel.org>
In-Reply-To: <2a35d31a-1a3e-4cd4-ac3a-27104ff12801@kernel.org>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 06:59:10 -0800
X-Gm-Features: AQt7F2oqrrSbnybAXKgWfgrkTYQBre96aRd65B4VaeoTMNsFPnQpfNlykmlc09o
Message-ID: <CACSVV03FfvZVzuKGfaJrsXmE7VVxEF5zN4-R7h1PXA11jOO3gw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/gpu: Narrow reg and
 reg-names for Adreno 610.0 and alike
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: BYBDbmtnBSxKX8MtuOpfShtreRRK-ty5
X-Proofpoint-GUID: BYBDbmtnBSxKX8MtuOpfShtreRRK-ty5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDEzNyBTYWx0ZWRfX9e2tbKub1SmY
 MogdG09X7/tWn09JwSXeeCVFnl+SS2XiDRhDYROa8s6jT+ivKOObDE3kypJ3VSq7WVET8gM6Kf3
 Q+U3u/dG0Iv+o4xfuygZArEgbLSO9MGHGejHE6ZRpltOCQXRLM+EWbvwyBMlXwiFsnxYXE/ETKQ
 26DC7ZSVAMGgt6Xt3UTkkOl5dmHf5Uk8Gs1EreE/40EwPqvD/Coi4tGsGN3jQgoLAjKyAb8KKxj
 gPNJdlv98PMcFvTD8COGlHcvbJBPk/WTjYr5xrpuEdNeJu+QzSsUJ+15m0JZAwYO9pi3hAIflCB
 ZANYD2wAYkNTAk16888/5MDFqe+rVSwZAUE6S+njj3H0ThwNkX6JBWC/huYbtE/zo+pndtqgHhq
 s72iDphbX3lFRlvCkTskCchogEQCWlgBUccI12F6ZjGZrWzpvDzDTN+NK6TEqJ6XLHFCLVa6IUR
 llDZWusBhnab8h1EpdA==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=695145ca cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Oa6cZlz9vDz7Y1gBjq8A:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280137
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Dec 27, 2025 at 11:56=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 27/12/2025 23:01, Rob Clark wrote:
> > On Sat, Dec 27, 2025 at 3:05=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> >>
> >> DTS files for qcom,adreno-610.0 and qcom,adreno-07000200 contain only =
one
> >> "reg" entry, not two, and the binding defines the second entry in
> >> "reg-names" differently than top-level part, so just simplify it and
> >> narrow to only one entry.
> >
> > I'll defer to Akhil about whether this is actually needed (vs just
> > incomplete gpu devcoredump support for certain GPUs).  In general
> > cx_dbgc is needed to capture state for gpu devcoredump state
> > snapshots, but not directly used in normal operations.  It seems
> > similar to the situation with mapping gpucc as part of gmu, ie. not
> > something the CPU normally deals with directly, but necessary to
> > capture crash state.
>
> I don't get why binding was added with cx_dbgc, but DTS not. Neither
> binding nor DTS depends on actual usage, so I assume someone
> intentionally did not want DTS to contain cx_dbgc and binding should
> follow. Otherwise we should make the DTS complete and make the binding
> strict (leading to warnings if DTS is not updated).

I'm not sure about the history.. but I can say that cx_dbgc is only
used for gpu state snapshot / devcoredump.  So it would be easy to not
notice if it were missing.

We have a similar slightly ugly thing where gpucc is included in the
gmu map.. only for devcoredump.  Maybe we need a different way to
handle these things that are only mapped for state capture?

BR,
-R
