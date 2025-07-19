Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA765B0AF1F
	for <lists+freedreno@lfdr.de>; Sat, 19 Jul 2025 11:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661C010E043;
	Sat, 19 Jul 2025 09:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIKe/XQW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2F010E061
 for <freedreno@lists.freedesktop.org>; Sat, 19 Jul 2025 09:43:39 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J8qDHF026432
 for <freedreno@lists.freedesktop.org>; Sat, 19 Jul 2025 09:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rhgfcFJFu0pycjGyM1cFEjZ0PRIhr6IT98FgwjCWEYk=; b=eIKe/XQW+VCrw6qy
 YDZuIu71jU6krVAEG2ro//VgSU2zD6oREy2R73F5f006S9h81k8XEGWAIURic6/s
 3C/z2ibBhsgp0kMODRuAAN+JBFcjgvxv/koBXdeEy39ebHbJAxNJqDY17Gwpojwq
 f/KI17OGkh0tUZ4fhv39qWLu7OlGVjfbVkD0m57Ao03Sn0UGqG6EhvTY1rU6Coce
 RoIwuwbAHtSCf3oPsN5jdsd1aMnjD/beax6buRrZfJimzhSvAS3+kcO7eCbWRKYN
 cXCct5kYpWcudSGRIiTgogUiLLa+1MOoQLpfnConsFxieo1+CKhVwXaferS3JKCf
 avz83w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v0dtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 19 Jul 2025 09:43:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e237c2f4ddso387138185a.0
 for <freedreno@lists.freedesktop.org>; Sat, 19 Jul 2025 02:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752918217; x=1753523017;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rhgfcFJFu0pycjGyM1cFEjZ0PRIhr6IT98FgwjCWEYk=;
 b=PTUVDOB06fcij4Y2onfdBXtLKBFctskSYGDNAU4ytoujFIb8W+uSiF9+2Frj46zT4a
 T3ADHaBqzqlC7sAbjIWK9GtUciv1hrWMti+f4KyjsJEhxnvfSTO9O7z4+PArJoUe0lvK
 HDupYnBkcllkUhhdYwUjeyIDKvEjxW+P240DNkc1O8aa8e1z8RNPOQGWW0BfESPt/VU6
 eCOCSa0+2mf9RIAQPCfgx3Z9XizC9AZhGAiUzFvrsE9mdME42TUiJBR6NawAx3ui2IGh
 uN3lY0mlZPi75OMHvBa+JCzYAdGvRZcbSnpJBmhuyCfkIy/cJ2v8IAzSms3qlaLYtq/t
 OC9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyw4urFKpDaV3hEiAI/+23emg6M9Er/OTU9suBYOlg+xTA4cTlFzlSIkqNJ94zdZhDAVptoPhvFUw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/aJ8kDOsxr4Y+q3DuU3TUJTL1xd0rixKSaxpGJufsgSllGwut
 6dBQMXyjcwO1NFVpg9KA7t97hfZOj/vi5gCbnprwDXxYNy7NEQb8Kbo/jJYTuKzqZ4khklperb5
 W4KyfVnCeSUccd1e9iTyYMENAAYBV274sosWj/9IoYjKMesALmxX/YgHxGCm6db6QknoehfI=
X-Gm-Gg: ASbGncuQI8yhYd4OGW+Q6iRXlDIuJnywfR6p+EvscBd2WQxP3BRwos5BiUQz1Z5vSUQ
 /g8XaxCGTPTQ2oSD3aI3R0ZDWIIw6n01u0NcYKEt8ntjNqSRNo4rU/cEBKUMJ9jDHGc2p1sazG6
 FGx11UZ1llM0KLz+EoVBtK+UYuUvCmfdCufnfciEI688x3tCsJ7veBTpeB1hPriner3vEd7gmXB
 RriRrS5j4Z9n54muNFT/lJ/MIwXleGO+ECHjkOqZ42mAlSYOBUTqCmCXmLhOew5wbrbYCHFwnpe
 9obD3+a5UN6PGQiFjRgtuquAQvBGBykMP+0SIGXcVpiTfUMnGNHe9FTgtnvWWZGyvWnoBn8pPka
 du8vlULItKsWOpfStquWTEk4pl2yWNikXlGy0coIn/T+/6/oZtcJ0
X-Received: by 2002:a05:620a:8509:b0:7e3:35e3:3412 with SMTP id
 af79cd13be357-7e34d9ac2e5mr834617585a.34.1752918217059; 
 Sat, 19 Jul 2025 02:43:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO4TN2m1HCMk2uK61roXdJAndfjxoSfPKSTjVyKPnhMXeMW5zR1fepHcMLF91nfBnN6lMC7g==
X-Received: by 2002:a05:620a:8509:b0:7e3:35e3:3412 with SMTP id
 af79cd13be357-7e34d9ac2e5mr834614885a.34.1752918216533; 
 Sat, 19 Jul 2025 02:43:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d7c7basm652746e87.94.2025.07.19.02.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 02:43:35 -0700 (PDT)
Date: Sat, 19 Jul 2025 12:43:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 quic_xiangxuy@quicinc.com
Subject: Re: [PATCH 7/8] drm/msm/dp: Retry Link Training 2 with lower pattern
Message-ID: <w66xyhu5w7ajpkennvj24cad4j6izvapsp3reyla7iui2jdgkx@d43b6z3qw5tj>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-7-09a4338d93ef@quicinc.com>
 <CAA8EJpoN1qBHyZrQJT_=e_26+tcaKRnSrhtxrK6zBP4BwpL=Hg@mail.gmail.com>
 <b4345b9e-62c6-470d-b1b0-4758cef7f175@quicinc.com>
 <xlmgdysjah3ueypdrdu5b6botvidb2wn4rfm4qpeysclscmuwy@vpfv2ymprblj>
 <b4e1ea54-ff3c-408e-8716-f48001ec9113@oss.qualcomm.com>
 <d427de7d-76ac-4e5b-b79a-3b7638a8e7fc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d427de7d-76ac-4e5b-b79a-3b7638a8e7fc@oss.qualcomm.com>
X-Proofpoint-GUID: 2zIGbsz0VBl0NYlyLSyYTjxUaGVyt-oW
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687b68ca cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=YZjHnbvoZT85EzRjquwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA5NiBTYWx0ZWRfXxA04VCZZICnT
 bVlNLL7k71DMg23a2KAp/oqmTmCTIdM99J1wR29zlK5FsSJmWqrPT/Vz7IsGXKzluK///CSgqG1
 PbfDo/LS4/FSifhnpRhq+SG9NqvMiokT+gt5QeSG5C5JCUre28B3QVbx+ot88GlrTpseJCJFvUK
 /u963StECv3gChIjuBeMbC1tezZGIMpuURCuj6SqjUsgzFZiqcxPHxatPnD54mJ4DXm5ErLp+XK
 LmGhnbTsQjUMfK0o3RsAI9QOwCHHFcpBM4zbyxin7k9We2Ff/Btfr+nDwqCpzAtZnOek3HxrpPK
 IrNyLykKSJMMzIhgp939KMBOHBiKmI22ioExKvVutahedlwc8xd8bGaAy2Cwk/+ySHAPTPZzziZ
 zvXDYKi/C0eIfxcKC415REHSTo8UDOt9nElnVdhlfPRjQYhb2SSugnNGDRfqgBXxhUN9f949
X-Proofpoint-ORIG-GUID: 2zIGbsz0VBl0NYlyLSyYTjxUaGVyt-oW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190096
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

On Wed, Jul 09, 2025 at 05:16:02PM +0800, Xiangxu Yin wrote:
> 
> 
> On 5/28/2025 4:49 AM, Konrad Dybcio wrote:
> > On 12/3/24 3:07 PM, Dmitry Baryshkov wrote:
> >> On Tue, Dec 03, 2024 at 04:13:22PM +0800, Xiangxu Yin wrote:
> >>>
> >>>
> >>> On 11/29/2024 9:53 PM, Dmitry Baryshkov wrote:
> >>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>>>>
> >>>>> Add a mechanism to retry Link Training 2 by lowering the pattern level
> >>>>> when the link training #2 first attempt fails. This approach enhances
> >>>>> compatibility, particularly addressing issues caused by certain hub
> >>>>> configurations.
> >>>>
> >>>> Please reference corresponding part of the standard, describing this lowering.
> >>>>
> >>> Per DisplayPort 1.4a specification Section 3.5.1.2 and Table 3-10, while the standard doesn't explicitly define a TPS downgrade mechanism, it does specify:
> >>
> >> Anything in DP 2.1?
> >>
> In the DP 2.1 spec, mainly on section '3.6.7.2 8b/10b DP Link Layer LTTPR Link Training Mandates', defined 'LTTPR shall support TPS4'.
> The other parts seems similar to the 1.4 spec.
> >>> - All devices shall support TPS1 and TPS2
> >>> - HDR2-capable devices shall support TPS3
> >>> - HDR3-capable devices shall support TPS4
> >>> While these capabilities are explicitly defined DPCD for sink devices, source device capabilities are less strictly defined, with the minimum requirement being support for TPS1 and TPS2.
> >>> In QCS615 DP phy is only supporting to HBR2, we observed a critical interoperability scenario with a DP->HDMI bridge. When link training at TPS4 consistently failed, downgrading to the next lower training pattern successfully established the link and display output successfully.
> >>
> >> Any other driver doing such TPS lowering? Or maybe we should be
> >> selecting TPS3 for HBR2-only devices?
> > 
> This logic is porting from qualcomm downstream, 

Hopefully a downstream has some sensible commit message which describes
the issue and the configuration to reproduce it?

> For other device, only found in some older Tx chips like i915（intel_dp_training_pattern) used the maximum hardware-supported patterns, but not lowering.
> 
> According to the description in DPCD table 2-232 003h, From the DP spec perspective, it appears that all supported cases should preferably adopt TPS4, as it is more robust.

If other drivers don't perform this kind of lowering, I'd prefer if we
don't perform it too.

> 'DPRXs should support TPS4 and set this bit, regardless of whether the DPRX supports HBR3 because TPS4 is more conducive to robust link establishment than TPS2 and TPS3.
> 0 = TPS4 is not supported.
> 1 = TPS4 is supported (shall be supported for downstream devices with DPCD r1.4, except for eDPRXs).'
> 
> Although maximum capability of QCS615 is HBR2, but the actual pattern supports TPS4. 
> From pure design perspective, it would be cleaner to drop this lowering in next patch. 
> > Bump, this patch looks interesting and I'd like to see it revisited if
> > it's correct
> > 
> > Konrad
> 
> 

-- 
With best wishes
Dmitry
