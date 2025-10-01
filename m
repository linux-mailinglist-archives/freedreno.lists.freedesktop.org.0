Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCD2BAFE78
	for <lists+freedreno@lfdr.de>; Wed, 01 Oct 2025 11:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F46410E309;
	Wed,  1 Oct 2025 09:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cr1g3ir5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CBB10E309
 for <freedreno@lists.freedesktop.org>; Wed,  1 Oct 2025 09:43:50 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5918UNHa013362
 for <freedreno@lists.freedesktop.org>; Wed, 1 Oct 2025 09:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 N2j4IW5NnafXAEbG+pjQfoEONtDY8QkYi5eJLubVjC0=; b=cr1g3ir5UkiwEBvm
 MF19xEjjZNFLpWiia40lSVhQJTEc/LnUBzjVmNmES0Org2hH21Pcot5oQIn6Z9mQ
 RuNTu13ANd3FIpC2NErDG1DK+9d9ibnw7f0Bl8ZWKLUSk283Iz/GNwl29XmC/Xd3
 wPBG5gr7LbO9RTs/8SsFC2oDoH/nCu/Z6X2JgH3LVnAiHe195pbrv7VG34rC1Q3s
 iY53lsuoBS7eNdx8HgMUZOlAXd3NoIYOi1+vQSdAX0YORyd3RaluYOTBye6Z1hCh
 QDcFDYCttVQERidFCO/7vyP/rwp9yghkSyLmxDUs/mgBy0iWRsn46dwQYc8TxzZr
 xX+HPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a643e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 01 Oct 2025 09:43:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-85bb4e88394so4921885a.1
 for <freedreno@lists.freedesktop.org>; Wed, 01 Oct 2025 02:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759311829; x=1759916629;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N2j4IW5NnafXAEbG+pjQfoEONtDY8QkYi5eJLubVjC0=;
 b=Tyaq1/VkznePi9Mh9mMTBTY1XUr98Kd3vaimXajTKhUG6hghUosY+c2YtPBRzs5SRE
 pKmNhkR/xEy+kiJ9mdtOAey/XxJMa0dju7C6Qu5YATc99vgVkx0MF9byAg47czg3kCUy
 pt9CeDQrml/6PQegIaaXEXEZ75Vpj5UkbPuoOLVIjM5eMLAXD/Evl7WyLjJ7JnAYrTDR
 KO6Bs7Niapf83OzinKpDl/HgTWkuu1/qXytxfghcj3KcOvs3gX+Bu8HCLGscdFUTXMKN
 jiaru8ndXZ3jY6ZNCdf7ZN2+08LDqr2obF1GwXkuwfzV6PIfcVP3zr128JTRVyrbieXC
 hLYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsikLK0938B8xsSQ0MjzoVN2WDoo0Qnaz2aPZ4PR50ShGiK5Nxx0y92f+yxMhghagnSv9xlvPk/Ak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu3fE+vI46wUUvxqKLIWj1atoMmQudeAvhyxd2cdKkcDNXk45P
 FS/CXf+ejwHNAAZIp1586IePJ4LmwN9B2qC62cmMJL+aG9ZqtgFvWTlOZqKHf71RyWM5oksM3Ls
 2HEJOmT49up1kqjVTNpbsjJdolPDYsN8hO/g1wl+k3Xa9m3EGf+QOE6JRAueuNIh4NrTVJkE=
X-Gm-Gg: ASbGnctyHDUGyt0tHgp52/uIaHJyrGUEfJPfCWHBuag6bQOZ2UlYb88lVCq1K5eiKw/
 yrpZDx4vdT9T7QQfsiM+TuoT4Uw7F5+pV23ngiHZRU7BzkQgSjF2WCLo/S0pFdfjK1MSXbfOQMv
 B0nCKMuIqNx2MjMP2XEH8BQptvzOMytwxthGb0cDmX6LbQm3C+xPEGEL3blxb82n7bufPhM7rS8
 efsElAHX/CWruTwhqXP0H5YLpTLc/xYfsd8dV3xVXqA8w01U0SGTPk6ekFoVbHbBjEZwnFZ8PRO
 QqtBY7xV12D8q8NPE+29zHYuRm8EK58nmk7KfN3VpsHFnIE7H6z4NNRx+afAit//BFBbllJYy/E
 /LZRW1ctOFkkUVDgPSZrPlhVhNU8=
X-Received: by 2002:a05:620a:17aa:b0:856:40d2:b1a5 with SMTP id
 af79cd13be357-873765c02d2mr274223285a.13.1759311828632; 
 Wed, 01 Oct 2025 02:43:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQhu+9IequlFgOauptmEqJZoeziWIrkfkjGafmFpxFA4oL+2QREZWtpjKdLAbnfpl7vBk6qQ==
X-Received: by 2002:a05:620a:17aa:b0:856:40d2:b1a5 with SMTP id
 af79cd13be357-873765c02d2mr274218385a.13.1759311827918; 
 Wed, 01 Oct 2025 02:43:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3e60de51c5sm648473466b.15.2025.10.01.02.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 02:43:47 -0700 (PDT)
Message-ID: <869d1f94-9d66-4045-abdb-6e88d504a884@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: lemans-ride: Enable dispcc1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
 <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dcf7d5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=ANimo7j06tBtS7Sznz4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bH3VhsSVHC91P1-MWxITZoFUkJNfnZtd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX8DFsyWR/pkGk
 +jwWez4sY0SizWMRif1ipSUCp0UykXDeP0L+3V2LdrD7BVg1rmTEW0oxkQyOnjFfeKypgLb0o5k
 sEXrLvC4FqMzMnvut0TiLS52JZudvCf2vvBt9TeoBRNUiOQgulNIh/3HsIXGYrkxxsThBA2+hKo
 4tQedDFzPibGGfoIeC9rPU2VRqeXdseFou68MM3M1Pm89SjLvnfauEOgcLpyPHIpHG2/x7ja0+v
 YSzYq3L+whBVVweTg8EsnAbieVGS9E0oqbIYRnBJNq5iU9Gxd+n8KQxT4HKbvJJu2K56odz0Xak
 eEtWZYV51K3UsHjEH+R7+2ywKmdRm8IzXxkNSr/Yl78GeD4d1tfssqDA2Iu77Y/+U0XCG0QeXsJ
 nEXEzxOqbuTbuAGFzdZ+kmTdVBRgXw==
X-Proofpoint-ORIG-GUID: bH3VhsSVHC91P1-MWxITZoFUkJNfnZtd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
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

On 9/26/25 3:53 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 02:29:55PM +0530, Mani Chandana Ballary Kuntumalla wrote:
>> This change enables display1 clock controller.
>>
>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
>> index c69aa2f41ce2..d4436bc473ba 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
>> @@ -436,6 +436,10 @@ vreg_l8e: ldo8 {
>>  	};
>>  };
>>  
>> +&dispcc1 {
>> +	status = "okay";
> 
> I think this one should be enabled by default. Unless Konrad or Bjorn
> disagrees, please fix lemans.dtsi.

Of course there is no reason for clock controllers to be disabled

Konrad
