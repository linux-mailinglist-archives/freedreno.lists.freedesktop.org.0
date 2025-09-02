Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF4FB40A94
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 18:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E5810E7E6;
	Tue,  2 Sep 2025 16:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqnWvNzC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC33A10E7E6
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 16:29:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqBHC018273
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 16:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0Xxhh8bgiL0H7q1l1CPpc3m0
 Gq3jEgstS7KK5RQ+9VE=; b=pqnWvNzCfd/RNxtmImQvE1QlmXaD3JuDbokxD8+e
 AlRWtv6H8yq2RMDqaZhS/1/aHWoBKFqaeesFrta4ZToioz+CPQ6kCKhG2x3MquSN
 OxsdldxaaYKNMZgdc6b7ylAh3z9ASeezPKbGsaM4iWxR8vx2Vap2AoL/aFLCotcv
 l7Bsoe9Y+ktRiFqOTR1gPSkd8LQxTd/EuFj4oAwaLiwmrh+gpT7/OVRS45SDhfY+
 694mpFOnpDAlooskdhtjXSmCoOiVQsoBzWdGXhFN74lwhOFtXD7AOx7md/e09oX8
 xc6F6YCDnTnRAaXFI+mI1xMncK4nGcARjs3HYt8pBs1rTw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvwa8s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 16:29:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-72023d1be83so29620816d6.3
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 09:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756830568; x=1757435368;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Xxhh8bgiL0H7q1l1CPpc3m0Gq3jEgstS7KK5RQ+9VE=;
 b=rO1jSoD1RiV7Zikqi1cwrq/eqYX5kIRYBmKTRRNsY0Xq96eAkWBsu0Zqx6Yq9tQTgD
 c+y5bmOjPkHzk7astESUUt1iubmtuT14j8qGKg5wX0B0LsclLeCBHi0rrv9KtzSzru/A
 nGfMwo/s/f/k/smwcF7WVE+CyGnJZH05gf8A7CzllujqjTSTe4l1urWfIuGtY20uuKR6
 qlFJQYxMB4Nq18WHRywFzMr88GOqe3+lOfPkAIaC5n4t9ryYy41AdBpA0oPzsqey1FwZ
 otPLdTBbF9hCpjlUNjXGVKu9HdyprrLPmQHTw20vPKG6tg777kqvdi/tUjvHvIKQaNpz
 358g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/n6Xjooq1O1rqf0KGbodkDRM4eD8hg2OHyPxG0fP0kd9qq6aB7w/NypZlt6IODS2F5eoZB7NsLW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3i+74XizlHyKNvnjwOARheGWav5mL+fTrZ2Yq13GJ3XfN16qo
 CVs7aQWsT65pJwtINzIUV3pV3glFph4GqLGbBepPTNQpGSLJwIa1Y5vqY30U/+Zs+QxqD3HLftQ
 LYUNmj6K7JUBczj6MCfmIJjQIRsvsGEfCs94IQlDMKaIkHQsXYTRosJhoBgvJjOj0mRbwosY=
X-Gm-Gg: ASbGncsw73YfhkM1pcZVmbtoC/pNh4yofYO9IfpXOYa0wwtOj7HiPaB+6fKGMPAzORG
 Hw/a/vDN4Qw7VLCeRukTrW2nztDNlMn6Orpz61KRh9Cbe0QYxnd7/HfGTb8Lvuu4fr7WfUIww3f
 vzrwjgijSVRj/a+UsYX+aIP0oKUnTAed5Fbll1rJC5hcRSubaHu3vuywYFYDMRld7LpRtKQtV81
 lb/pJmMiLxfHj8AJkNpLc0xSyArTUMBtDzAl1/yRZnK8+DePN+7fsWy6EribIF8a4O9CoWZOIIB
 yoBtH0hhN9AADZKbMMhNojGW9gq0czRc5lv9gHz7ewM+Tp1xtFOz+ART8+v/QkkMZknSWqxskcG
 3ksLe2A4YluFWGCgPFiI3OrCK7hbbLEJs3Lcm9FK6KaBatHkU1HWZ
X-Received: by 2002:a05:6214:2527:b0:70d:f3cc:59e2 with SMTP id
 6a1803df08f44-70fac9458b7mr133850076d6.61.1756830567713; 
 Tue, 02 Sep 2025 09:29:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFvokzjH8YEZWHbH11++jlAcTV7UtSBU6wke16GEF1L7hdGxUd+DZW6hiZcGYHtBEnpACwuQ==
X-Received: by 2002:a05:6214:2527:b0:70d:f3cc:59e2 with SMTP id
 6a1803df08f44-70fac9458b7mr133849526d6.61.1756830566977; 
 Tue, 02 Sep 2025 09:29:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560826dd3fcsm808649e87.58.2025.09.02.09.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 09:29:25 -0700 (PDT)
Date: Tue, 2 Sep 2025 19:29:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/9] dt-bindings: display/msm: dp-controller: fix
 fallback for SM6350
Message-ID: <rivif67xphnva5ql3s6p6gk6uzjde55nzi34unyqktrrjtalgm@gnjqibxo6jzz>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
 <20250829-dp_mst_bindings-v7-2-2b268a43917b@oss.qualcomm.com>
 <20250901-arboreal-gay-wolf-bcaaec@kuoka>
 <qy6c2gundpbz5ixqpt2hefzfb56wcrzcaclqwg2opof4zc7lep@dpc3nv6usurk>
 <24999a53-ea5a-4823-a84f-2ca0ca184bb4@linaro.org>
 <ysj4ndb4twcvmlxb3marh2vktxxsup5l6ioljdgzlod46uimh2@pkgta6r3ydqx>
 <c69ced3d-d1f1-46a8-9930-463306b1ba41@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c69ced3d-d1f1-46a8-9930-463306b1ba41@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfX8BAnby1dlXTO
 XHhOy3ibZmSJgM8oiWx0Hli1PNIfnNnoSRp1l+/gyHjQBCiPKwk1uQGHTJjAntxq/6BVZi69XyQ
 KHthAB9q+anw3dIe4YuSCIGfBvY9/rplXlMjPTYcp3SvUba+6PVNPp7v93/i4ydXkhctCBTJl7I
 OnQ76aiLTNiDKWwk1kU6TJzXmhWHbdANPoC+ryzZniBf+GHDMA7oAZpzhBzGnsF8+Vj4bYx9LMx
 FDsStNlC9LcD/oGXhaMs6Eaki0cidcUdOK/j0i0JOK5+WdC0ZsadZdfKd1xNsZwN1A+CEB+rwJL
 0e+ovyTtEj3HbJvOI0+qQuoHFNPQX1a4SMlFImXAol3RFzmMAO8GW0AhMAm0OVfQfuorGBEAuWu
 qa4TIjo6
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b71b69 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=CoDk-osl1XWOh_45pGoA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: w-0bx6URyPcDRYVjonOfC1uQn1OePbW9
X-Proofpoint-ORIG-GUID: w-0bx6URyPcDRYVjonOfC1uQn1OePbW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024
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

On Tue, Sep 02, 2025 at 02:09:02PM +0200, Krzysztof Kozlowski wrote:
> On 02/09/2025 12:01, Dmitry Baryshkov wrote:
> > On Tue, Sep 02, 2025 at 08:04:54AM +0200, Krzysztof Kozlowski wrote:
> >> On 02/09/2025 06:03, Dmitry Baryshkov wrote:
> >>> On Mon, Sep 01, 2025 at 05:45:49AM +0200, Krzysztof Kozlowski wrote:
> >>>> On Fri, Aug 29, 2025 at 01:48:15AM +0300, Dmitry Baryshkov wrote:
> >>>>> The SM6350 doesn't have MST support, as such it is not compatible with
> >>>>> the SM8350 platform. Add new entry for SM6350 with fallback to SC7180
> >>>>> (which belongs to the same generation and also doesn't have MST
> >>>>> support).
> >>>>>
> >>>>> Fixes: 39086151593a ("dt-bindings: display: msm: dp-controller: document SM6350 compatible")
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>> ---
> >>>>>  .../devicetree/bindings/display/msm/dp-controller.yaml     | 14 +++++++++++++-
> >>>>>  1 file changed, 13 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>>>> index aed3bafa67e3c24d2a876acd29660378b367603a..0f814aa6f51406fdbdd7386027f88dfbacb24392 100644
> >>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>>>> @@ -31,13 +31,25 @@ properties:
> >>>>>            - qcom,sm8650-dp
> >>>>>        - items:
> >>>>>            - enum:
> >>>>> -              - qcom,sar2130p-dp
> >>>>>                - qcom,sm6350-dp
> >>>>> +          - const: qcom,sc7180-dp
> >>>>> +
> >>>>> +      # deprecated entry for compatibility with old DT
> >>>>> +      - items:
> >>>>> +          - enum:
> >>>>> +              - qcom,sm6350-dp
> >>>>> +          - const: qcom,sm8350-dp
> >>>>> +        deprecated: true
> >>>>
> >>>> If it is only about bindings then there is little benefit in keeping
> >>>> this, just drop this case.  However you cannot drop it from DTS, so this
> >>>> is a bit pointless.
> >>>
> >>> Our plan is:
> >>> - land updated DT bindings, describing MST clocks on MST-enabled
> >>>   platforms,
> >>> - land updated DTS, adding MST clocks where applicable,
> >>
> >> This part breaks all out-of-tree users of DTS.
> > 
> > User of which one? SM6350 or all DTS?
> 
> SM6350.
> 
> > 
> > It extends the ABI, so no, it shouldn't. We add regions and clocks,
> 
> No, it does not extend the ABI. You are changing the fallback, so you
> are changing the ABI.


I was thinking about the whole patchset: adding DP MST-specific clocks
and regions. For this particular patch you are correct.

> 
> 
> > existing users can use the previously defined feature set.
> > 
> > Anyway, is it about adding more explicit note to the cover letter and/or
> > commit message or would you have any other proposal on how to handle the
> > issue?
> 
> Please be explicit if Linux was working with the old fallback or not. In
> the DTS change be explicit about impact, e.g. that sc7180 fallback is
> there since forever.

Ack.

> 
> > 
> >>
> >>> - land driver changes, keeping legacy support for non-MST DTs on
> >>>   MST-enabled SoCs
> >>>
> >>>>
> >>>> Lack of MST support is not informative enough to claim it is not
> >>>> compatible with 8350. For example if it was working fine via fallback,
> >>>> then that statement is simply not correct.
> >>>>
> >>>> And it HAD to work fine, because there is nothing binding to
> >>>> qcom,sm6350-dp.
> >>>
> >>> It is working fine since currently we don't have MST support on the
> >>> driver side (nor do we describe MST clocks in DT). It's true that the
> >>> driver will have to handle non-MST DT for SM8350. However I definitely
> >>> don't want to describe both cases in the bindings. SM6350 is not going
> >>> to be compatible with the MST-enabled SM8350 schema.
> >>
> >> The question is rather: is SM6350 going to be compatible (working) with
> >> MST-enabled drivers.
> > 
> > If somebody implements e.g. U-Boot DP MST support after we land DP MST
> > bindings, I would not guarantee that. SM8350 will already have second
> > stream clock.
> 
> 
> Having second stream clock does not mean device stops working with Linux
> kernel. I can easily imagine both cases after adding MST to the drivers,
> the SM6350 stops working or keeps working...

It will keep on working, since we need to support old MST-less
sm8350.dtsi. 

-- 
With best wishes
Dmitry
