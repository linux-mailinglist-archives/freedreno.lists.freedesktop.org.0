Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76005AAE551
	for <lists+freedreno@lfdr.de>; Wed,  7 May 2025 17:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3F110E84A;
	Wed,  7 May 2025 15:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPkq35zO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DAC10E848
 for <freedreno@lists.freedesktop.org>; Wed,  7 May 2025 15:49:04 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547APLew021933
 for <freedreno@lists.freedesktop.org>; Wed, 7 May 2025 15:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=sCssKQwqlkZybFzzJZnS5cDS
 IKfik9hOyKrvkleK4eY=; b=EPkq35zO6ueuQcbFY7Px3KxAZJumYb2SgJYVMIQG
 QOioTsVercQ9Au6rONc5DUjOCZRprRLhxNKz3eMeLFu2GH2boF1onBY7bAz9MkiG
 Y2DGVLDXvhDEPOCOGzZB+lpfNFOkRvIE5/xsJ4tyCuOvp380xcEbaPii4Z6NoGze
 pXm+AeCpkNvWQ+sU0J1HHA/NFSQi10WWQAekdRujOu96+FDISDMgYl0v1MY+v1kl
 e9sn9SIYmj9YESZxEhnWUkSrBXXkaG5BxQGNS16Zt4bG2IWfmjnjXfXR/tFdutke
 d3jCuxNW0I4J+t4Yl1W2cCBOpv+rmQr315g08EoCtE8Mcg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5uuxdg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 07 May 2025 15:48:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f0e2d30ab4so984666d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 07 May 2025 08:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746632938; x=1747237738;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sCssKQwqlkZybFzzJZnS5cDSIKfik9hOyKrvkleK4eY=;
 b=L8X4OWpGgCGjRw+35/bKZlR0dqskS6a86IFfK/nzCkt9JaYs+56UzM34dTrcrtLIDy
 Bxb1SqcK4Qme3zJ1eopXTLFYv0w4Us6qvpGyI3tv+mbw59RKY2yo5R41mBfeY9o0vS3j
 Qib/sLmusTkPRmxNNufXMt8T0f5rg4N/6sMIbGqIEbaDB5EZh0GjByzR5p3XE3cj2C4g
 vwrtuyOsTT77hjs3Rcsb+iPFBo2ef72No3KEqFDFaQBMVLwYpvoup9L5V8YfUi66B0Pq
 yOTzsE+ayPomj9fG3X4nbA1IYhocG2JQKwwZdInfT+m8PmBn4vXIW4fdIovjRhSxzgjg
 tiwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRm/fDfQAoDsHZbH2wY2OQHniU+q1vRhGQ3397OrLuxAzgViDT3rQ0o6s0pLUDSgDtvLLBH+ODxj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziEQ36UL6Y0EdRxF9JaghRAoHS52y84CbQp+Kar2GMuj7CEqO2
 QQKJumRYnxB/Hn3d3mXLi3FeInZKxeMR0P33Y573MRyxYP0gXb1YH9LkBmqSwdUDbtLXF/Scll9
 oOKaJXQGjarKCZkLwst4BpZygNgboQum9fNu1bRr795Klbu7zMDq+WNBFvYQK4ogPCEk=
X-Gm-Gg: ASbGncuiplCJqmdvOFf8/6SfHnN1FDVuZ7deSNOIJGdEzQvT/f/oPa5dhX9IHMyLVyf
 VTKojw3l9DDf0eihlxJt96/BmXfo2GrW0FO6oUrDOuIIM3gNHg5J0mhxkZ+6sx4FHZojpniwHxO
 ig0hAhpg30iOi+hLzRWQDWzdjquMMpC7wIdZoRLGePKJfiR3Y5DoOxQF8wd39zE5HinlZNkQ6E8
 UEP0B3ikwbmZrWzlduW1Tut7WYNvPDNzhLxnE3T7zX/AVe3xeef6ZWHOAn6yjHNokifJNmotnp8
 82/VYQb0ZP9RQaM5v5Jkk5G+IQ+YJ48/q6Z7sX1BfJlJ5sJmgl6/sF8noX5tcpws/gcaQKWGG+c
 =
X-Received: by 2002:ad4:574c:0:b0:6f4:f1aa:bdc9 with SMTP id
 6a1803df08f44-6f542a22256mr63115166d6.7.1746632938279; 
 Wed, 07 May 2025 08:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpqKBqvVCtmEDGnqQSDIg99DPZFwCrSN2UhDVL/02dWzadQzFLThTPNaoR0pTeP+O9HpyfqQ==
X-Received: by 2002:ad4:574c:0:b0:6f4:f1aa:bdc9 with SMTP id
 6a1803df08f44-6f542a22256mr63114676d6.7.1746632937860; 
 Wed, 07 May 2025 08:48:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32029306984sm22747811fa.58.2025.05.07.08.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 08:48:56 -0700 (PDT)
Date: Wed, 7 May 2025 18:48:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <m6qrmvku6anw6ajg2qdbusodjxesfusi7w2pogvvz5lj5vfyx2@mcit7fy5w6ij>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
 <20250505094245.2660750-3-quic_amakhija@quicinc.com>
 <grwlmrgi5cfv3jtuki57ug7gsqykpwdf2to2l7di6glfxtb7vz@6id6cpfkrbuh>
 <88b139c4-0a35-4c9e-9993-573fede29b71@quicinc.com>
 <ip2phi56u4yof376t5a5mqhvo3x4oo4blcnirwc6w7eancpm7i@ofcgyfcxdmre>
 <bd136800-8ef5-4597-b918-41b9f97db14f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd136800-8ef5-4597-b918-41b9f97db14f@quicinc.com>
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=681b80eb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=hnXmAr2WX_wFmnp3NVMA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Cd7v32aSxhhg3qJA_ZU_lz8s1sSGewVm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE0OCBTYWx0ZWRfX96Vbfo1J3R/g
 3DTaZ9TF3LOUQs7otzFd7gWqcWrKyifWexewb30upcXinS/7CN6ubMpQAzPcglCB+rHjKc2EYt5
 O8ItWpRgcZ2/4u950RMxKFkBajiaexyRdwUnZ6wqB8G2YYKudwJnd3+2+ggrJduC0WQxGxzA/b2
 2W0a+6Qd0vIN/UZ9QnA/rwRBVFLSR/kQrQh2WvgYROW/aqgGT3N9ap0UMXVQWJzfU85L9cy3joD
 rwXe9l7sQfqDFpifNtWTNTzT8O0dfN24b3NMEISp3Y78rTxiFgS00vfzy42MLltvcCf9ZrtQD80
 /D7KbB/SG6xNAlxFdDJ/JDL+mdU7vVXqiDtkK+K9Bpg5Tr2p0UqwQDWTB6dBaiEGXVr4xiVI4rb
 AvsBaahLgp4t97XriXCx1U6FsE93Ysf1Sg9mOg7ZXJTEkJpu7wPQrJQ9+WhW6pis+2ITTwuu
X-Proofpoint-ORIG-GUID: Cd7v32aSxhhg3qJA_ZU_lz8s1sSGewVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_05,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070148
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

On Wed, May 07, 2025 at 06:27:54PM +0530, Ayushi Makhija wrote:
> On 5/6/2025 5:58 PM, Dmitry Baryshkov wrote:
> > On Tue, May 06, 2025 at 05:42:50PM +0530, Ayushi Makhija wrote:
> >> Hi Dmitry,
> >>
> >> On 5/5/2025 3:32 PM, Dmitry Baryshkov wrote:
> >>> On Mon, May 05, 2025 at 03:12:41PM +0530, Ayushi Makhija wrote:
> >>>> Add anx7625 DSI to DP bridge device nodes.
> >>>>
> >>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 183 +++++++++++++++++++++
> >>>>  1 file changed, 183 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>>> index 175f8b1e3b2d..de14f3ea8835 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>>> @@ -28,6 +28,15 @@ chosen {
> >>>>  		stdout-path = "serial0:115200n8";
> >>>>  	};
> >>>>  
> >>>> +	vph_pwr: vph-pwr-regulator {
> >>>> +		compatible = "regulator-fixed";
> >>>> +		regulator-name = "vph_pwr";
> >>>> +		regulator-min-microvolt = <12000000>;
> >>>> +		regulator-max-microvolt = <12000000>;
> >>>
> >>> 12 V, if my eyes don't deceive me.
> >>
> >> Yes, it's 12V. According to the chipset's power grid, the VPH rail is rated at 12 volts.
> >> That's significantly higher than what we typically see on mobile platforms. I guess,
> >> this is due to the SA8775P Ride SX being designed for automotive applications, where higher voltage levels are required.
> >>
> >>>
> >>>> +		regulator-always-on;
> >>>> +		regulator-boot-on;
> >>>> +	};
> >>>> +
> >>>
> >>> [...]
> >>>
> >>>> +
> >>>> +			bridge@58 {
> >>>> +				compatible = "analogix,anx7625";
> >>>> +				reg = <0x58>;
> >>>> +				interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
> >>>> +				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
> >>>> +				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
> >>>> +				vdd10-supply = <&vph_pwr>;
> >>>> +				vdd18-supply = <&vph_pwr>;
> >>>> +				vdd33-supply = <&vph_pwr>;
> >>>
> >>> Here you are saying that 1.0V, 1.8V and 3.3V pins are powered on by 12V
> >>> supply. I wonder how the board doesn't trigger all fire alarms in the
> >>> building.
> >>>
> >>
> >> Let me try to explain the connections from the schematics.
> >>
> >> In the SA8775P RIDE SX platform, the ANX bridge supplies are connected from the below sources:
> >>
> >> 1) AVDD1P8 is sourced from the `VREG_1P8` of the backplane card.
> >> 2) AVDD3P0 is sourced from the `VREG_3P0` of the backplane card.
> >> 3) AVDD1P0 is sourced from the TPS74801 LDO voltage regulator that has `VREG_1P8` connected to
> >>    VIN & EN lines, and `VREG_3P0` connected to BIAS line.
> >>  
> >> The `VREG_1P8` is sourced from a buck converter TPS54618CQRTERQ1 that is using 
> >> `VREG_5P0` as VIN and EN_VR1P8_M3P3 as EN signal. 
> >> Where the `EN_VR1P8_M3P3` is an output signal from SAK-TC397XX-256F300S BD micro-controller.
> >>  
> >> Similarly, the `VREG_1P3` and `VREG_5P0` are sourced from another buck converter LM5143QRWGRQ1
> >> that is using `VREG_12P0` as VIN and `EN_VR5P0_M3P3` as EN signal.
> >> Where the EN_VR5P0_M3P3 is an output from the same micro-controller.
> >>  
> >> Combining above details, all three ANX bridge supplies are getting enabled by `VREG_12P0` supply,
> >> `EN_VR1P8_M3P3` and `EN_VR5P0_M3P3` signals once the SOC is out of reset.
> >>  
> >> The `VREG_12P0` is directly sourced from `VBATT_IN`.
> >>  
> >> Since, there is no SW control for ANX bridge supplies and they are getting enabled
> >> once the SOC is out of reset, I have used vph-pwr-regulator dummy regulator.
> >> I am not sure if it's the right way to handle above scenario. Please let me know if there is other way to do the same.
> > 
> > Add these regulators as fixed ones, describing the power grid. Consult
> > other board files if you are unsure. RB3, RB5, HDKs - all these boards
> > have fixed-regulators for the grid.
> > 
> 
> Hi Dmirty,
> 
> After referring the RB3, RB5, HDKs boards example for fixed regulator.
> 

[...]

> 
> Let me know, Which way we need to define the our anx7625 bridge supplies.

Please describe the power grid. As accurate as seems logical for you. I
won't give you a single 'this is correct' here, but generally I'd prefer
having all vin-supply properly set. Please use grid names from the
schematics in order to describe the regulators (instead of inventing
them).

Hope this helps. Anyway, it's easier to discuss the code once you post
something, so I'm looking forward to seeing the patch.

-- 
With best wishes
Dmitry
