Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7E3C7D200
	for <lists+freedreno@lfdr.de>; Sat, 22 Nov 2025 14:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0679310E09B;
	Sat, 22 Nov 2025 13:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkHHBHDF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2WMIECj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA9610E092
 for <freedreno@lists.freedesktop.org>; Sat, 22 Nov 2025 13:59:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AMCbmDI2552277
 for <freedreno@lists.freedesktop.org>; Sat, 22 Nov 2025 13:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UPiNAw1Tt7RvkHyG8Y7Sk3PFLPISpHRMaZn89Q+0vA0=; b=CkHHBHDFmKRJetWF
 BTF5P9rQP8repvG6d0gkqwZWg0dTXYONHjh1vx3a4x0EqrffPCCl3Z91MoVbvluz
 ckzFVa1prFWXIFOAN6QGQkOb2FbpT8+e/4eN+vVglmyqwYAkS6KiSekpYCG6PwMW
 1JXTf8KzbIUlivIeDFQnjIrTVyNaGMEChpsVq9uefFKNugW87CkYxf/tf95+NsTS
 WIM2NEFmhcNj11cX4uCuBmMnV0p09/6snnaJTo6jtH+NJGczOkySWgxgRy5kxtfk
 dFL/orxmn4e1ghReTFTHJHKh9L8z1VkMWyfjrcVlHP6r3dcA3qMbYejtAdo8k5kH
 DjX2QQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak69err5s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 22 Nov 2025 13:59:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee07f794fcso10018631cf.2
 for <freedreno@lists.freedesktop.org>; Sat, 22 Nov 2025 05:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763819986; x=1764424786;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UPiNAw1Tt7RvkHyG8Y7Sk3PFLPISpHRMaZn89Q+0vA0=;
 b=E2WMIECjRxGnItR6f+PvQMgZCxKAia8+0uyA0+6W/LCy2MIwtRgC2xOoSlxNx5QxkD
 XUwFjK74dg10YiYUwFp4S/S8en6M928jyG0cn8YXQTLts+dXyD9SkXTysZGu+yh+1Azd
 gWOe/pdDYKtZnDMNR4A5Pv86s1rkEyZpwzqdd4TruvC9KHcT+Jg24dDH/Bw7i1EQ+Bfn
 ICnG3NaeY5Efodvh78y4TEgHoAPY5Gb6ps5I0sxy3sG2gzaV/txaZPVzhNnAybw7yq8L
 Fk+UB0Hs6aTe/gymqLuxevcdWKtHreFGq4GJ1LQRKO4GJWG1o5EZx/crX52f7ubsMg5U
 EmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763819986; x=1764424786;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UPiNAw1Tt7RvkHyG8Y7Sk3PFLPISpHRMaZn89Q+0vA0=;
 b=KoPYtxiov35t9rotuHwbBPLesUgm2laeFxQOVsi19WcMJSMp5LsOEi83YmfIiOLzl9
 HnwpPEqg6916v5ktBIF+FV4+fDW133K3AT5W4HJLsQwBneI8W+wQqy5EOlzxc8Hvsx9Y
 XIU81glU89NVt+1bUKK+81wV0widDCuuAiarLJB8ClG3zv+HZ+qjRwzsYSV/DsDAmAsR
 VdH1ujsxN67KZQDhontFRJGUliygTUelBo9F7RKr+Db1+bgdGDHh923g4Avef/Igr0D8
 lUT2kQ/TfkU7/FFXGZMtc5nZm63BKg9NFc8dX1+zXPYOTxRbSGiy7Tr9CgVqNFXZAzTy
 0alg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr+YP0LKA1GmA7YNtqBUvaZR+UR7AAi+Y+8Ld3fVLtI2N0BcsExTxfn7V74MaS6aXksXlmAHjXL7M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFG3W22X+0sXUmsQStuCC37sP06bfhdOE0nOLt4woLupujkZO/
 ZzY/K92qS4M8kkaLBtHgdJbXiFM4qe8Ih/jTMSSaA2fMAzKJgChw0aiSvtabYc/Cqo8mFNWDj0M
 1RrRpoGVUGAy4cs8b0nSFT4jujPtgeoLQYw1DqjN0hyCnjZuSd13Gb2If7oErL/D2gHVqqoQ=
X-Gm-Gg: ASbGncvpkFAKdkmYwqTJj0Is+rXbci7QW9unkZ9lFNmkjxfTj5011jVPN5Ur7S31cao
 cCdI05IgFmayqcAAst8lkfX1BwXYtL3g03/q3dqU+hIh4XyX5KdtGK/zEj2tUV4qeEqfD8G9H2d
 IlBiDAC8jcz1TCMOQLtovzUFSjiVPZjWCJtJV5un/ponpY+H+V42VKtRVPjcZbShHfBGNH/feno
 LEeGRMpoKYcfgl3XXb/yVzcXSkKsUF0+UelFLyv+sqoDwhLFeuU7llSKlvMKccwGjAregOSFWUV
 3lRnCgNieBYL8UFMZMh8XaXoU4idNayAckW6uaL65wQ23SrN6qLAO5fl5VX023iAH7VszdRwLyM
 hD0AfsqYII54zJxjC6mj4ZT2rZlUsCXIU3FoFNkTU7HaZb2JQf5/6H5e9YPuKeRza7Ms=
X-Received: by 2002:ac8:5a46:0:b0:4e8:a54d:cce8 with SMTP id
 d75a77b69052e-4ee5885ba39mr57660301cf.4.1763819986387; 
 Sat, 22 Nov 2025 05:59:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIJN+vL5B0qzR53Fu8tdU0kJslcRoEiovdfi/oC99Dchs3yUA9islhgT15c7fVbBvVSSpozg==
X-Received: by 2002:ac8:5a46:0:b0:4e8:a54d:cce8 with SMTP id
 d75a77b69052e-4ee5885ba39mr57660091cf.4.1763819985888; 
 Sat, 22 Nov 2025 05:59:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7655038011sm737185266b.62.2025.11.22.05.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Nov 2025 05:59:45 -0800 (PST)
Message-ID: <039dd3f2-3ea1-4dbf-81a4-ef1690c9236b@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 14:59:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: sm6150: add the GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-4-9f4d4c87f51d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-4-9f4d4c87f51d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDExNCBTYWx0ZWRfX88COHmZwjdT7
 ztdNK9ef7tPKHa88gmxJUfcr1IfyOiGPry1XZ/iF734zCgd1kkxCuCt8olw9tLNA+pq+IUWRIWy
 Jm5wyKDZU60ovznZhOul4jO/Cu0njOez/GKlFBWccgNer4vQApi0fVMc4CWLfnDIVp/zZ21fPuh
 KCzopkIlOoG99jw+SYnamgQuD2sXCcaZ0braSsDc31xXBK/TNXYg5q8rh9Pd2ITwOrvc3pteLnD
 Fo0+2+PtoabyIIx4IlR0Fa/TAFKFj7Llzwn3DWf85/UcyfGqQJ4BNENq5PTt0JmaLMtJk6Q3GRl
 GnL1rW1P3NprlX7wYRxcrt4yJTsrCaIsin1djyCO/vmLBnfjY7/jFbbm1zO4Xd8xTBKajUD+0WU
 9MBH0bzs1PCxy93/aOQvMXo/Fsny4A==
X-Authority-Analysis: v=2.4 cv=cMjtc1eN c=1 sm=1 tr=0 ts=6921c1d3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mYtwdgaTN7BQyFnmkxnNVUmHZfcFnpTA
X-Proofpoint-GUID: mYtwdgaTN7BQyFnmkxnNVUmHZfcFnpTA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220114
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

On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for QCS615 platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
