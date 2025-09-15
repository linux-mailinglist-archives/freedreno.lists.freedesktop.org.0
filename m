Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74567B57575
	for <lists+freedreno@lfdr.de>; Mon, 15 Sep 2025 12:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE4710E34A;
	Mon, 15 Sep 2025 10:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJGWvMVH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA5710E34A
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 10:03:11 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FgLj002144
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 10:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iNJb9aBoW8s0FMiS/YZ9p7xI2r8sb0NzpQjCEzw6dyk=; b=MJGWvMVHbgq0zK09
 OJ59VyRCwAkg6z9Y2Z98viKfYf3Aqds+STSfibyZnNaYQWThswgGz+TFMVzyxJHM
 dBvM3QQ50SITB6Vh2CzOsORsyOObN4kDWJYhKtzUPxI8xlXhmcxtIOOa59jKdHuL
 CMi3gNAZLkH72urj5E9BT2aFRZz4CRS7eORsfMCH891HQVQtB8S2kRFbi4lN1vMB
 tOApXXnhh+oDfW5gZNcrHkA05txE8Paqk0dZTkLgKcvNd/bFByZvu/H1TTsXWevI
 D00jWAbr4FAtWPvXUwnKIpAG5ezmvpMB000Q299aevibP7qbxjsxniRhLot0MOhx
 zojXwg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da98u1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 10:03:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b47b4d296eso106980781cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 03:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757930590; x=1758535390;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iNJb9aBoW8s0FMiS/YZ9p7xI2r8sb0NzpQjCEzw6dyk=;
 b=U9HcGhPCSt5lMrKbA7/NVLlPlVEQijlDjyA5poJbYOe1SdYeqHgDVumczDZZdOv4Eh
 DVCWz8MHc94eaD3s2mAKkonyQm+mw7hDtIKrOUgBBdGeH0CiGahq1sQd5OyIQkLKMGAv
 kPGDmUYuFvGdTghzsiPPcWHU1kWxV5nkRfI1+UKpL1hFJClHQeGz/3fyMn3r2caKhokN
 IdWrmhz+kuPKEbUJ9cVFzBd9geMIhGUN6wfNHfWWIi4h2FWNKA2TC3U1OMoYACwafS35
 7K2YZHK1g4m01/ahMohbwtOOtzw6zLSwgitGI3EMy85R8OQZhxL7lQCGShLipTQmQhLs
 IeiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw5NSvwIYYmd/lB3QXIdIPu6qbmJT4ECJZZVLUA3Paej2d3qzVJQz8MbnCL2U7o9xa6N4rgyxzclo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza7HoBklSj6ha8dTTVQysZMZiSMxB4zsAG6ACy46oYHYZzMx0G
 Yo/nckw4FkMO9p0Xhf5IUHVjqzoIyVRrIxZwLR5SP2J5xyq5WGzzfe0T2apB3nD7M8bZykiC8C+
 n5+O8PSyZDYUEN9dL1SfOnL5a04nBQZOL8rt17WRsJY7v07IrPcEv2UmL0rmBsQq2oEGD+0A=
X-Gm-Gg: ASbGncs1Zb91Ob+MacVuHxWhlR1/DWK1Jb6nwPUpJkEPV062LDeI0itgTkHxMYOeRaM
 7Occ7Q20p3Go93uTiwVTlQSwtuybbOyGf/ws5FW3TbFH9hA9LdHgFlqEP15r/+g47dZsCyntzwd
 NbAqWDg2pjPkamk1OIDm4D0wRdKvw32O5C0rb7D9mVZRqxVWjn8m800z6GVTW8gBxZtyGN8BRCQ
 /ltd6NwWoJrarX6jzYn8My2DLTVGRkIgRUYpT9WoQLSgqJpW49QsWoaYJLajvMXFAYRYaRDdYth
 gen+z4omtJdvskcYV47nQTle+jM/iNcsWl5rvhWzqV7+ImUImAqVOJkmUbkA3X6wp/ZP+WLuUG6
 I2iAO9iu+FXR+W9K199x+Ap/mCFymQ8JRNjf9g2F0IEC2C9QpJdSw
X-Received: by 2002:a05:622a:120a:b0:4b7:9ae8:6ea6 with SMTP id
 d75a77b69052e-4b79ae87162mr50917331cf.37.1757930589637; 
 Mon, 15 Sep 2025 03:03:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfpvRgAhMNhUxIeD9tNbprQD/TrxHXCB7JaEsEcvWEvuJOODOSQVkWTR5TtGrU2694pjoctw==
X-Received: by 2002:a05:622a:120a:b0:4b7:9ae8:6ea6 with SMTP id
 d75a77b69052e-4b79ae87162mr50916841cf.37.1757930589119; 
 Mon, 15 Sep 2025 03:03:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-571459c1482sm2723638e87.0.2025.09.15.03.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 03:03:08 -0700 (PDT)
Date: Mon, 15 Sep 2025 13:03:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <v3vuphn3n4w6ynpaqeosechjdcelomn53atwfotka7izqvjuid@nnvdwxqlelrp>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
 <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
 <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
 <droyp5atpjauyttqkwqzk64kkghg6jkkubvfz3zlbrodyzlvoe@fbns762o6vcq>
 <6bb0cbd0-d3b2-4359-a2d0-6b757f66d0e0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bb0cbd0-d3b2-4359-a2d0-6b757f66d0e0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c7e45e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=RKHcw_4USbZLBnuPHksA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: U4aCbYgKIn1eaYatgY-0cyCtexgXd7Ev
X-Proofpoint-ORIG-GUID: U4aCbYgKIn1eaYatgY-0cyCtexgXd7Ev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfX6Bb/hU8TGIbQ
 O6gQzO0xnxxCqSRzYyCWfg+TxLknzwcTd8cibJZGCLOeu41SabqrK94YoPov6wvyq54VfdR2Qpn
 Mg3vKlJnLHh+GCFbL6sftAjYJ9gV09U4kvqPZAPowUauqiRKoB23gsX3gWUSUwhU4UNRIER/+1N
 wXlGWE1dxHy2RB1YtIryfLvPT3gPcngZKIf+dIvrkY5kNKrvEmRXGrtnLiZ8mWE0slVDmlJv42y
 IME2QowbMHwQDf7DrA6yUYCAemcgjz1j+mRXBuEF1BcDebLVTLfUIJnOw7nIv0DF+C4G8JvSJLc
 /e4AAWDS17k0CCJtIDUPcV0GCbyx5vS52eHDKapdJpPlOnq4NmwMSrpwq32rr/jdzSoNnIr648+
 3WA+AMqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056
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

On Mon, Sep 15, 2025 at 02:26:12PM +0800, Xiangxu Yin wrote:
> 
> On 9/12/2025 8:10 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 12, 2025 at 07:54:31PM +0800, Xiangxu Yin wrote:
> >> On 9/12/2025 7:46 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
> >>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
> >>>> SM6150 shares the same configuration as SM8350, its hardware capabilities
> >>>> differ about HBR3. Explicitly listing it ensures clarity and avoids
> >>>> potential issues if SM8350 support evolves in the future.
> >>> The controller is exactly the same as the one present on SM8150. HBR3 is
> >>> a property of the PHY.
> >>
> >> Ok, will update commit msg.
> > Please red my response again. What does it says to you wrt bindings?
> >
> 
> Yes, SM6150 uses the same DisplayPort controller IP as SM8150. I wasn’t
> previously familiar with how fallback compatibility is defined in the
> bindings. Since SM6150 will be declared as a fallback to sm8350-dp, is it
> fine to drop the driver patch ([2/2])?

Yes

> 
> Here’s the updated commit message for [1/2], does it match your expectation?
> 'SM6150 uses the same controller IP as SM8150. Declare SM6150 as a fallback
> compatible to sm8350-dp for consistency with existing bindings and to ensure
> correct matching and future clarity.'

I'd prefer if we have "qcom,sm6150-dp", "qcom-sm8150-dp",
"qcom-sm8350-dp".

-- 
With best wishes
Dmitry
