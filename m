Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CC2B5702E
	for <lists+freedreno@lfdr.de>; Mon, 15 Sep 2025 08:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA5710E2B6;
	Mon, 15 Sep 2025 06:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSQ7m4bJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D3D10E2B6
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 06:26:24 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EN0dNV026970
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 06:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 p3cqF/An1AZjw8JVOz9xUECjqoR0vI9WU1IXWZyL7Ro=; b=aSQ7m4bJjFzNFsE9
 VSYPcz4xcmtaJlDYhC2EqGRUm5ndV0GtZ5ZBeFj1LG8f21dM4HFUVcP/Qazs4L45
 XQxVIPundh+0tP7/APebYUPMFWTcQxN9OVcP1byjVF1P5Uh8pRvGWO7EUqQxkE0N
 pT/lfc/eZPD91lpJhu5PqogW9Ekn8y2aszHjn8LEVB1C4Xf8eGX1j4d6LCX9fDty
 NFDaIUaSlsixlxtqVNaCN/c0k4rS9pH6tcKJgMdDT/49vF7p/a+BvSarI08jOi/O
 2mww+i6wAEfLN9bvaRDrLHZG/EhSq/ICZPPgbGmCXUhw/pgg1rA35kABR+uRmVN3
 M75Hjw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yjv3s68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 06:26:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b54aa407bc7so798737a12.1
 for <freedreno@lists.freedesktop.org>; Sun, 14 Sep 2025 23:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757917583; x=1758522383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=p3cqF/An1AZjw8JVOz9xUECjqoR0vI9WU1IXWZyL7Ro=;
 b=mHZTd8JAT7Ms/bCxO0XmTCsAx3EfBI/BLR1Zqx4umo6OA5A6w2m1+qCoNJRThk8lsd
 tTUXWfjhyJYG/inqG412pbx1NSKcZ3J5tMXTQ95hrb5l0mVDRyHqaCXZOWbYekawLrnc
 uOGRSTTsn9ROUL0o5p5HzjJKqDkkecBexVMSGBMvsu1OUwBQ1e9gl85mCuFav0A6Cq3x
 gS0uomoj90zwvS+p9WdDCbhokK3uPcMdXG6ZuvOg5c2sXpvb/d9nFy8kbxlDo6sBfw4t
 xT1bsmc25N5CZA/hcaJSJy6QsvG4E+GHtCy0P2vjvXPBy2EEPPdb3GPOjYolglSvBJXz
 OTOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMEH5rKH5YswmCeURfH3UMUr6/vSFqgd68wLV7iYQKXKy7a7xoDgjpgUiUuL7+IoNWN5Zjd6PTKA8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7IQ6/5Z263QMR1pwEmHuueV7ZmtdbDyp7ipbp/VouowlMy4yK
 fzTdwWA/IOeqIMgoGDfT92j0UqS6RiFtOeI9pW9hlMhutT0ZpKj2fm0izTczdt+XeFnOEzlZdv9
 e+hAHTq9hMiQ1v6CJnF44tPA1cMcWaPwCi3xjIax4oNBojog9kcvCOWrVdnA/0hoBjX2vtDs=
X-Gm-Gg: ASbGncvIr6OWJ+u5lJ1Jf0fxFK+lzBnWYO9s2KnWj/FJxMcd0dUCyE4qY3ceXHZh9H9
 KBFdxpL7r3vq/wYjfhFrC1cXEMATa19VG3DwzbVPD/1gGabCpOcrlgwQcpdek0XvWbsdNTYJHir
 qZM1/IHwCqhSTuILhLSxDd7AGfxiOHqLxg29D3HCegB9WZq2OD/+eliwfgMrSKSgSuJXxgGM957
 23+6IPqEDXlgZzTceQLdIOeEVoZlx9ywoHTJ3y8Tp8XNsq6GU9tkKpXId+w0trkIdptE9RDWf78
 OvcsFvCYiEUIxKo9ASm7Z27ORooaCP5gV6gY/nOSGdl7RO8KKAEkZjOlbl+YRNA0O6rYuF82ZFC
 3Fqz8/YOeC/2AykccHVpdmLpFQkpBx+EAdGk=
X-Received: by 2002:a05:6a00:a96:b0:774:2286:361 with SMTP id
 d2e1a72fcca58-77612060f79mr6738242b3a.1.1757917583126; 
 Sun, 14 Sep 2025 23:26:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnsuQAVbn2atzfG9WWx0sSeaLKGnzB1+E9spf7myo63WZ+ZUpm7ftykU++CRXawOnpXfnInw==
X-Received: by 2002:a05:6a00:a96:b0:774:2286:361 with SMTP id
 d2e1a72fcca58-77612060f79mr6738214b3a.1.1757917582644; 
 Sun, 14 Sep 2025 23:26:22 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607b347f8sm12075678b3a.82.2025.09.14.23.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Sep 2025 23:26:22 -0700 (PDT)
Message-ID: <6bb0cbd0-d3b2-4359-a2d0-6b757f66d0e0@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 14:26:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
 <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
 <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
 <droyp5atpjauyttqkwqzk64kkghg6jkkubvfz3zlbrodyzlvoe@fbns762o6vcq>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <droyp5atpjauyttqkwqzk64kkghg6jkkubvfz3zlbrodyzlvoe@fbns762o6vcq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HcoUTjE8 c=1 sm=1 tr=0 ts=68c7b190 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=olEU9l-643s81VMgE3sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: aKX-zdPIAFzdxFPtKT4xnsIleZY6UeHq
X-Proofpoint-GUID: aKX-zdPIAFzdxFPtKT4xnsIleZY6UeHq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxNyBTYWx0ZWRfXwdTfaQT7j4kZ
 fAo/RnwgBfrh3zotahCI41segExpPPCH13wzmt8L2ZTYDFSSBYDn4rP/gMS2WtcgKK+jrTE5Q2A
 R63pMZ+e0Z9fdD4sGYUYQRh8RFrqqegsp01qPYgHcYp56ESwwOz3NQWPwLzZeNqYMcFNf8M0RYY
 SbdtYk7tqPVVJPzBIGyFDUfPKT7UGoMuVETxeM9FVvJtPAXkKkT1n2arT04ih+ozAIEPptFaREJ
 wZJXtI29Ilnlw1WMrivIMCXnjgqKIGqzZ1ydRZDvc5qZZv1uZnnwzzvULiCpEt7lwQVNG55xuxk
 hNa+/VQWQlGVoaZslmHIiHS4xLfRhoDP3X61fC/c8onkTQxDdvy9vo9tR1hjhbatVsOj3BhNyta
 lvFTvMxK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130017
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


On 9/12/2025 8:10 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 07:54:31PM +0800, Xiangxu Yin wrote:
>> On 9/12/2025 7:46 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
>>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>>>> SM6150 shares the same configuration as SM8350, its hardware capabilities
>>>> differ about HBR3. Explicitly listing it ensures clarity and avoids
>>>> potential issues if SM8350 support evolves in the future.
>>> The controller is exactly the same as the one present on SM8150. HBR3 is
>>> a property of the PHY.
>>
>> Ok, will update commit msg.
> Please red my response again. What does it says to you wrt bindings?
>

Yes, SM6150 uses the same DisplayPort controller IP as SM8150. I wasn’t
previously familiar with how fallback compatibility is defined in the
bindings. Since SM6150 will be declared as a fallback to sm8350-dp, is it
fine to drop the driver patch ([2/2])?

Here’s the updated commit message for [1/2], does it match your expectation?
'SM6150 uses the same controller IP as SM8150. Declare SM6150 as a fallback
compatible to sm8350-dp for consistency with existing bindings and to ensure
correct matching and future clarity.'

Thanks again for your guidance.

