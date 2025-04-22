Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AFFA966C4
	for <lists+freedreno@lfdr.de>; Tue, 22 Apr 2025 13:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AA410E1DD;
	Tue, 22 Apr 2025 11:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lv9deyP0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D794710E561
 for <freedreno@lists.freedesktop.org>; Tue, 22 Apr 2025 11:02:49 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4Os3O031908
 for <freedreno@lists.freedesktop.org>; Tue, 22 Apr 2025 11:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=sJhtSdw5nK1pkgx2a60KWDZ+
 +Ku84pOdAteitB7NlXw=; b=lv9deyP0hg7JX5LqUsV8SP8lgKAQfS9cGDSlrN24
 KXiAQzT1X5p2TU4H1meirbYwqPraKBqT/HgqEY3tdBjxMT9OplOHv75wdVVztgA+
 VBahFk6NYoR4/K+nE4FCPJhzvEJjqBzG0UI71PIY1HUcMSCdSa5OPuG9W7PoPCw2
 Gqe7bO8lrdeUBwgOhnlu0iN/U7Yh1GSK69iXvRYhKiUmxtExDc6GKJxiVS9u7BV6
 ggAV74OWgBSFEZVKcCm5sgLfpmsHnvrOvE1lQF9AKYEyts6L8Nht6TyU1wulKVDr
 l4movz6vzHEFwGInOy1QKvEgQlIbjid3tGGSHb6rJzkzpg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4641hhqbsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Apr 2025 11:02:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c09f73873fso762000285a.1
 for <freedreno@lists.freedesktop.org>; Tue, 22 Apr 2025 04:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745319768; x=1745924568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sJhtSdw5nK1pkgx2a60KWDZ++Ku84pOdAteitB7NlXw=;
 b=uTcuyFTCIDFi/3AgJNNP6KMN0JU6ifnJmr9XyvdBpnlZ3NKOTvvZuC+XQfo1l//PG8
 bP+MKMHOkPK9QikNPU9JFzu+zB/yKkCQUnf7VrwXmnqyQT/c3R1ONHmDM8xzhMKSX0p2
 s9RQRfgjgp+itpd97cRHF1mKNZJQKi1QQZBRmmnniejNqX3rB2x0IaSM4NZV3d4Y3aVU
 /UsINiSxDppN/ZFipB1HMLGeXhXAljqeI5hQOCgf1sfv1Ij2V+6YI8d2lqk4KzgT9HDj
 Sr/hDZ1wWwk8aFSnxvBdH1jPRplPVWarwR+usWttx0WOty94N5VdkYb4EriJ9vhCINOk
 swRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuAO7OZ4se0hgYllsT8IqY6/KvUarcIje3GgoeG6Oc1P7dAsF6RvJgN85fBI0KMXfOHRdqR/b6Yec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRAmMaXgoMG9hVntbT8KxE7aTEanOA3HtVrebZaUWfrFdI8aoy
 l2Vy3igfbGkc5BMd8dvv4GL8XaQ/dwEniRXL3vktPbEoOmGx71Kff+KZ0+rAsxNczgNBYWKDDv2
 INUJe17ZqosY+qmyM1CPlLUPCnJaAM2UQpUY45Mq6l05EETcteWHeIYGoSukc2zqWmy0=
X-Gm-Gg: ASbGncuTcYLWgSYctbsqHfcDUp9MiTsr8nIGQmW+F5O1dYtRuMSELM+/4xI7CgoDtzq
 KyDqJlHdXM0iR6E+U6iCnJAWz0tpmmsdECBxZDoMhJb0JwoPXQCw+SgmDSl34VQxc+LIipMfSMM
 m6nwqCPa5XE5MiorRi/fYK17rH/PPk436NUOxxfg4DvrFuzdFRzgP5+x8QsAt40nHO8LuUYq5L/
 WMcYK5EB9nNabYBYOoFAoyK+xkKYIM2rl+a9xEBVYRHyVqBAXpEHBPYAGp2mcaPgm+KfrJ4m9Nl
 L5FyM3jfaC47EG1tWzdWkcj1ngsIFTc2U4plh5uVknUhtwVrTEHlxchURe3Y9vlkFSPi27DbPa0
 =
X-Received: by 2002:a05:620a:17aa:b0:7c5:a41a:b1a with SMTP id
 af79cd13be357-7c927f6b4e5mr2210333785a.10.1745319767866; 
 Tue, 22 Apr 2025 04:02:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN4wwPzrrHx8nsqrV5sbJ9OQl73YTYbgT962Arex3Cx5QfII5Wsr6EMD6ZHVslJXEdDC01pg==
X-Received: by 2002:a05:620a:17aa:b0:7c5:a41a:b1a with SMTP id
 af79cd13be357-7c927f6b4e5mr2210328785a.10.1745319767506; 
 Tue, 22 Apr 2025 04:02:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d6e5251f5sm1189258e87.51.2025.04.22.04.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 04:02:46 -0700 (PDT)
Date: Tue, 22 Apr 2025 14:02:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: Ayushi Makhija <amakhija@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v4 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <2qpcmniww7uaemu5tvgbjpnijqqzlrcvf2dkewvumffnsdpsib@fl3tvbldtjds>
References: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
 <20250417053909.1051416-8-amakhija@qti.qualcomm.com>
 <qnhfnxvdsgnw5jh4xxaqz3p2x67qcrr7kn3vwdnyz5huchdtzy@aagflznjrvly>
 <d77353b0-94e6-4461-bd34-44c8cb80eb07@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d77353b0-94e6-4461-bd34-44c8cb80eb07@quicinc.com>
X-Authority-Analysis: v=2.4 cv=Fe43xI+6 c=1 sm=1 tr=0 ts=68077759 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Ofgg3MdZYWJxeOF5shIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lQjjwPHvVkJGIkH68pgXFwLESfvQ96zD
X-Proofpoint-ORIG-GUID: lQjjwPHvVkJGIkH68pgXFwLESfvQ96zD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220083
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

On Tue, Apr 22, 2025 at 12:28:20PM +0530, Ayushi Makhija wrote:
> On 4/17/2025 4:10 PM, Dmitry Baryshkov wrote:
> > On Thu, Apr 17, 2025 at 11:09:05AM +0530, Ayushi Makhija wrote:
> >> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> >>
> >> Add anx7625 DSI to DP bridge device nodes.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 180 +++++++++++++++++++++
> >>  1 file changed, 180 insertions(+)
> >>
> >> @@ -519,7 +550,107 @@ &i2c18 {
> >>  	clock-frequency = <400000>;
> >>  	pinctrl-0 = <&qup_i2c18_default>;
> >>  	pinctrl-names = "default";
> >> +
> >>  	status = "okay";
> >> +
> >> +	io_expander: gpio@74 {
> >> +		compatible = "ti,tca9539";
> >> +		reg = <0x74>;
> >> +		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
> >> +		gpio-controller;
> >> +		#gpio-cells = <2>;
> >> +		interrupt-controller;
> >> +		#interrupt-cells = <2>;
> > 
> > No reset-gpios? Is the expander being used by something else so that we
> > don't want it to be reset during the bootup?
> > 
> Hi Dmitry,
> 
> Please, ignore the previous reply.
> 
> This io_expander is used by anx7625 bridge only. I have defined the gpio in pinctrl setting and so far it was helping out indirectly to bring io_expander out
> of the reset. The reset-gpios is optional for tca9539, because of which the io_expander driver didn't throw an error and I never realize that I should add this property.
> 
> I tested by adding the reset-gpios entry and it's working fine. I will update in the next patchset.
> 
> + reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>; 
> 
> Thanks again, for pointing it out.

SGTM

> 
> Thanks,
> Ayushi
> 
> >> +
> >> +		pinctrl-0 = <&io_expander_intr_active>,
> >> +			    <&io_expander_reset_active>;
> >> +		pinctrl-names = "default";
> >> +	};
> >> +
> > 
> > The rest LGTM
> > 
> 

-- 
With best wishes
Dmitry
