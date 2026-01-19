Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE89D3A3DB
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 10:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D15B10E2A4;
	Mon, 19 Jan 2026 09:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NiGq8ksg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gvh0Np7h";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE5710E3A0
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 09:57:33 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J91GXt748359
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 09:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zQiCGCw23+ncTBD+A26faX4r598idfb2NSI47mYg6cc=; b=NiGq8ksg12v0mUEK
 ics7v1gD3TA/XcNAUhvKiKrUIpmqFswKYJD50rJi0pPaD6fXnmsyx5JxnR4BuMY6
 Fc1kQ7i5FnJYIoE4oZERN7FX2ioNELNAfgNxycbN3Hxg0CnPQYb7SYrR+KCsN43+
 ALXQihdhm624CZkt5pbxLv+QCb8NQnN9uZ5Yu56I/p5Ci5jVrgiw02PieO+aPNN+
 xyJiaARtTw0NUvwURQ1rynPgB8VeKkCl5x/g9pv9mIAZoan6MZWxnJUnq4d+IN4/
 se5jTbHUf565mODZsg0wurJVCVXzL+TuwF2ocZOZYvYREhPDrBTnSJKSxa3ZSJj9
 +mvwSQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t74jkc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 09:57:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c52d47dfceso79940085a.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 01:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768816652; x=1769421452;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zQiCGCw23+ncTBD+A26faX4r598idfb2NSI47mYg6cc=;
 b=Gvh0Np7h7AK6f1eHnP1pLtuwxwnpOQGSIZV5bf3Hl/Qf8/iLuTQ80X+J+vrJDeFSuL
 88yYdVee6ZJnClNwo8rQGbKyMS7v8Ddd5G7/zF6sxoDPrf9p5I3ps02VallYENb1JTi9
 tEzew69UzClRNOXKnPqTZNFCEPNAx+z7QCU+ofOW7tMa7HeVxeVxr3MqjpoFqmfLucd4
 kwdaXpbW1zjW6dRyOzzF/btt3K4wJkcknk3aFDcDwUa3roaQlIuzGePQHg/0Vby0A78r
 5EPvgAmGw2cRZ/ws4A9sYbfkIBB34acNx/Sw8wqMbnRTPLOPsVpVAY2oqRcteIq488tZ
 fXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768816652; x=1769421452;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zQiCGCw23+ncTBD+A26faX4r598idfb2NSI47mYg6cc=;
 b=VBtSQlcJoTXVBCdQIWcUE1wkEow7KSbKP4xcR1LGCeJqUUaVyuOfhVa4mDBmqdzuz1
 uQKyATSefCxPFdXSQtZB5rRnEC4EwvTwiGdxMmF2MTntk+HlRC65lOC2TcGGvS+yHf5b
 g8QxZmiQa4qSoIeAe+l1bBty6O2XdZDkcn5rKy8tO8I93qqQYYp4f+j3X7oQwybeCg7I
 2gANxd/GSzl8vpB0yWneaLWX0BOnFYq5Wrp0YQsXGoOVG8eVS+n8T4Mwvp7Uqvea8kiL
 H5fjlupzEosLGvyyei56vWaylykKIfvr8c43sh4JNoTGR+3/wFyiBk2eB8nZUDH8ww0x
 mTrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT6z+1DTm2JiwTGAmwg9eSA+xmrM6BYhoHa5gYf16roOQ4hFMFgJ29/AA7cRPT2+dR6dL11JttmKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqVOq8x3zjgsIwxXFGRC+a8vUdAFCyBpYHZUpY73GSaA3+xt9q
 O8h+22OU4pXGHmoUHRrG58eg8H/f5f/jZI4CvqmL5tdFvqckUmm/EFFm8Mas7l9whxREOLkFdU1
 TDKAGg1IFCvqJegmQ8QK0tSSjRvmMbL9+STMSxSmCOyhxi7kZWW8cqlpm/SYe7TLcJ/8CwSk=
X-Gm-Gg: AY/fxX6VjYsDlit+UibDLKaAp/NDrM6fTHwVBdNv3IvifrFHSY9WC01jTqLxlnqol+i
 rG5YRdOTkMBSEFp5QOhToOWoHqQ37Q/FKqTqzMmZIIzpWDEANHuwkaoxqekrUnYkAxxkA7dO1tS
 3sh1VEaefXRL7bdYo8RsIQcWrfdkvFEs7Kf/RDO80F/q0S2Pwt65rGrde68apDJjs5ElZN5m90W
 ox4QFRyZm4xI8Dp0lNtfeA67N4UTOknnS/cxfYmzeDlUF97A9AbpIuOk7l+Emtz9c2GyqDeeIBl
 Qmqm8ZqIIg4NYbbGt9gBtFSKOyp0G1Shb/xyK6CCt/fWfd90Xbozp+T7IYd8JCbpCy7LBpmNZay
 wHERdU9bi8qyyoAOqAeQOLb5BT6ImwGmT0GLH+9pHSdnwUHrHUtz3/sc9tG70X7+rX2U=
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id
 af79cd13be357-8c6a678d49cmr1121538485a.7.1768816651699; 
 Mon, 19 Jan 2026 01:57:31 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id
 af79cd13be357-8c6a678d49cmr1121537085a.7.1768816651168; 
 Mon, 19 Jan 2026 01:57:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959c9763sm1003138566b.35.2026.01.19.01.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 01:57:30 -0800 (PST)
Message-ID: <051f401a-a3e0-4d09-8a21-e6e323aecece@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x
 and 6.x devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v3-1-34aaa672c829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-1-34aaa672c829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696e000c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FnLLt5dnLMIZ3HHg8ZoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: b8RCLmMGDCoG4RCxQ5yGVaO6JH3xCE57
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA3OSBTYWx0ZWRfX+SKSKe8ao9SI
 ahn3ItgJcFH0rdb+J6WSNAhKHlZdcm/rPcK5Ya18srHZJ7FXSW6RffWhtwM0n7pqCAa9exDEF7x
 VonrpALF/66JOHX9OuVTbbUrjC69ToZ1VYZET/zW+erXRAC8ubc1kSWVf/2noxFkcNLHTQ8GyBc
 gBl9F9Fsl1gm2D585PTiT9CMmGe5s5iPkAyz7ueJSGSv6aMtbTSmUk3AVQI3aq9s4KwGp/Vfyyn
 3MeeWCJciKgCQe0PGqKGMHKXAKPLV6uEDCLVwhZbYGm3G2oZpS1QAQspnyAO00FEQ8JzKCC1Pcn
 4QdfiQVpf6QvU2NipjkviNxjSNFIlJzM/vIPpne2VbVlHfsHRxvAlVq6BRtxh+VGRrq+1sUXjMD
 E47yao8ElfufcxO4I4a1NbhM46IPMQI0vOcBjDPFHcFCmQ3L7jsx44pH7IY8I19lkYL34nRctRF
 8IAKiHL7Q36QAw8VanA==
X-Proofpoint-GUID: b8RCLmMGDCoG4RCxQ5yGVaO6JH3xCE57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190079
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

On 1/19/26 9:17 AM, Dmitry Baryshkov wrote:
> As in the previous generations, on UBWC 5.x and 6.x devices the Highest
> Bank Bit value should be programmed into the hardware with the offset of
> -13.  Correct the value written into the register to prevent
> unpredictable results.
> 
> Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

