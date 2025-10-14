Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4DABD84A4
	for <lists+freedreno@lfdr.de>; Tue, 14 Oct 2025 10:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5AF10E57F;
	Tue, 14 Oct 2025 08:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTIbnxel";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BEF10E57E
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 08:53:36 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87IfW005404
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 08:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yu6GxXvjzVdp0jD9TyFSB0cQTPVuV4yy/C3ICodMY8c=; b=kTIbnxelhGa2sVP3
 boJK3HyeqmX/0HOgmXYWMij4nlauwxuwRmcj0aAOZC4nC4JsZAFPBu3yvdYA6Gjl
 aJPSbjTRO5XYviCOe3d/StKOp4eBS4kFaxp8IpxTRPa9EkjQhRE97dB3bco2DMyy
 ExLDNvHIFyeDsenozVaaiXx8hbeOVQkVIE+06H8xn0QlAnPwUFvtvhDDXpzbJJUQ
 RES2xTPr6phcaIik9jHxJXDZ694LxbumoYb98FK4U+Y6oFD4smz72AGvwcXiFbD2
 WD+GJ8WUBOOrW0qJQc2Wn1Tv9xMjgxPvsZtyrVRg2G5DU5HoODBTW92jlmzk1aSw
 ffoEog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbhysvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 08:53:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8572f379832so237540185a.3
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 01:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760432014; x=1761036814;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yu6GxXvjzVdp0jD9TyFSB0cQTPVuV4yy/C3ICodMY8c=;
 b=M97jBsMEGgjdhSShCbYZsc+zQuwwiYkkkl35UVPdhrl4kghnk3088+NBMQEu3F9V/R
 uHup8XN1iQ7tJH/rfDxU4u/SGweMpBV1r3/EJhd/oDOPc0d/qIxPng4hnmsoPaRIOnpv
 xjmyapAi/WnHCVZ46kNGcNO3rTAwRCJ+atAMmdvjSKxr0kiWVi4MvahhhJe10oTlCEDN
 oxPLWf4jityaWon6JN5OFC0hQCp+Exm0pPNPECvfI9nXcn1u7miFCMa4/S4OZxOwSLel
 bRe+YsiwVCkFjI4n5ZbFmlgWxoXx++354KjLucyoMYvT+SUGF8adhLNxkpenbgjVqgD6
 wBKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1WlkdTrEyvyAHB7R3ZBw7qSaRp1r7V8+bVnElldGgca7QCPg/Rx5yWN3gEXOEkPLDwSxue+Eh+0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0pxwAEnhXyPAM3EgSc6N9J1bIyk3pTb74LQxY2FlslXxEw9cC
 6kZHaP8D9DMkKs129ZbXde2KQJMxTxSiKvmR6U+pQqAHvoyFNdCM61WW7LX/Uu13i0qYds1adfN
 4uRgg42VXv4wI/ZqRZwBHE7qxRZec7FOUBB8TizGiKbQCITZllYDKOvayAUA71HbCFRJkBrQ=
X-Gm-Gg: ASbGncv+qqvNfipddVwBWnDBFQ9mnBkVzzuEkjQzsUxu7eMK7G0LMP8vS/VExS3ah67
 yPzNpF1l00tEkrRp9sd5ToLK0psanH91qSdQnzGxidhey525GFquROhk165uiN+mnI56ARnYxHD
 SSWjqerXW1ZdHzlqyVqa+yGksO0MTfAnzujBG0OJrD4DQnx8i3GHHRKuZTcPb1t5Ek4gRJavU83
 BPd4VdaVPUh26Z35sAS/jCIWB0cg1zAlVQAaiY49qs4ojR7HrifXDWx3gVx0HWzsBkksqcpPRV5
 DSBtT6ZXBfQE773VqjqxS9fhP+G6oqsD5zQJd2xZV2bPzP0RtA2rJ2hUx2Ow0INvDecVVzVZe0i
 Lb+V+wSZ328HO4Ek99NhR3w==
X-Received: by 2002:a05:620a:372c:b0:86b:12e2:28d1 with SMTP id
 af79cd13be357-88352d954aemr2148348485a.7.1760432014512; 
 Tue, 14 Oct 2025 01:53:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm4ixM4YDDyNB4X3gy92GuzgILUxOgPYXhz9lsuSEFNcMwwXiOp3PYD1SDSeDU0RrlNXPctQ==
X-Received: by 2002:a05:620a:372c:b0:86b:12e2:28d1 with SMTP id
 af79cd13be357-88352d954aemr2148348085a.7.1760432014042; 
 Tue, 14 Oct 2025 01:53:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d8c12b4csm1136163866b.56.2025.10.14.01.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 01:53:33 -0700 (PDT)
Message-ID: <40a9643d-01b3-434d-9163-da35c2e469b4@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 10:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-7-quic_amakhija@quicinc.com>
 <fsqytqhe72bgmloyzm6khoprq6bysf52ufz6oi6epos7uadyho@wg4rxs6f2xyl>
 <374098ea-23f1-4d1a-8f70-313a7e384f8d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <374098ea-23f1-4d1a-8f70-313a7e384f8d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX2oTuJQgsO/VO
 ZKwijxlXMgfBf8HaTwomVlI0czpR6aAqKZybOttd7I5s2qAON9SwkLs3QOnioFfjGhjM9TWvHQx
 gjOGx5Halgs+Z8Dopg/5ZPt/hu6DLeI+DeXe0xEAG8QWLLKvEhURrP00kFzGZt3V1uROcKJGvRw
 JiUjkjTZXQUhznbKvFDwZI8GBNsF0hZ2DTgtv9mqjzGRR3WmJGlRfDhdWX1pkPTkA1c0+RpuRbh
 EzeXqmZuDeuP/wMLsF108nthybVLFhe/xfmh6WfL4hzH6EpfvV/aZnHBUpypVwN/nB2lyP01hvc
 9wuQkJNkDQGvz51yWKCwODb8P56S72mZC5Q5+DvXrMurkIqVbzdmtCeHAZOsg4ChGZ3qpcmoheu
 Nhafn7i66qLE5wP15rwA8KJlrv6Fbw==
X-Proofpoint-ORIG-GUID: Mj3ldOZD_pK3JzvEW81at8yJ3F8HR0m4
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ee0f8f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=BM6OdSh4NsqE7HirI3EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Mj3ldOZD_pK3JzvEW81at8yJ3F8HR0m4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
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

On 10/14/25 8:24 AM, Ayushi Makhija wrote:
> On 10/6/2025 3:44 PM, Dmitry Baryshkov wrote:
>> On Mon, Oct 06, 2025 at 07:09:23AM +0530, Ayushi Makhija wrote:
>>> Add device tree nodes for the DSI0 controller with their corresponding
>>> PHY found on Qualcomm QCS8300 SoC.
>>>
>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 98 ++++++++++++++++++++++++++-
>>>  1 file changed, 97 insertions(+), 1 deletion(-)
>>>
>>> +
>>> +				mdss_dsi_opp_table: opp-table {
>>> +					compatible = "operating-points-v2";
>>> +
>>> +					opp-358000000 {
>>> +						opp-hz = /bits/ 64 <358000000>;
>>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>>> +					};
>>
>> Does it really support only a single freq?
>>
> 
> Hi Dmitry, yes it support only single opp frequency, I got this information from ipcat sw for monaco, similar
> we have used for LeMans.

I can attest to that, even though I'm a little surprised that's
the case

Konrad
