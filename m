Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546A2C0101C
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 14:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0EA10E3F1;
	Thu, 23 Oct 2025 12:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkYZzssF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4660210E3F1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:10:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6m4mt029729
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y0aZaieSuQfEQiaRXPzHRxz1LHJpL/jxRnElnXAHQ00=; b=hkYZzssFwV2Jk/VP
 Or1UkHDtl+OCssWsyMXSrss8YPIrs8IQNa/xSLaFxmZpL459R13jJTjsil/n4/gz
 qmDEFbNOVKHDFL0zZiduSekArgVsJVv7ingw2y1cM4EMdu8+8ziPdoNH6xKN6zP/
 1qKNWfZEcFQNtNKA1KDOaFxMbg5P9ke3YTC+tlWVVMyDQd7531vcA8Enxm2ElCwY
 8d/hsXzGHGtNMGvBtdGpzHqZjDUCj8TtGVvwUN8pFhcES70OEu6f+hgxgKWXb38Y
 0HK8lhn06ZCpJ7t1tqdsKB/6B4Cdosd6YQU55wSm3w/xWBjfeEBQ7O4n3LANeX2V
 +6F81g==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge8a1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:10:36 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-7c2848cc2c9so295308a34.2
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 05:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221435; x=1761826235;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y0aZaieSuQfEQiaRXPzHRxz1LHJpL/jxRnElnXAHQ00=;
 b=bQ/7QJWHwKDc05L61sUPEkH6rDbu4rL4fPDtC/x2I46r8ccOiw1WVXNxXewRPkjUD9
 uRJnEg0vwKT1SZv7cfLk+laSWPwyAjn8nnoSQ2pUXVvmNF/Fzad2qGz7lMX648tXAj0N
 IdEcIRpCbZICuQaR3EnDOqCzIJTURJj+hbeKhhwcsu068UD+x/UQiILkwdHU1OO9UdY0
 xKVx8Yqe8bPbBfAjwxqbAjY4DIDzL3IHrMquLy8Qba6Iw18ALPJm9ORDbgn128Az4bkX
 gzBwLH7lx1rvm4DJ4kChZiKo1NBsh0m1HU8gyzaJYT2SJ5489c/EuOabEAbSrh0JGA6h
 6W7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuKbpGVa1xxxJWoM9DeLGs+Ie5c46B1k/o9O5NS7qCeW0oRDCnAvIEzBNvmt1g67IsTqMGyzToWmk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDYtCGDF5lCD7/E7CilykEKfryRNC9kjUQFciDtXucMtzqIAfR
 7DonR0uOuMOolRWdoKF9ftpAMrEbUJl5fvcf0FV2TWFhAVVDMxbmzZijuplXyP4VPfTR60A0tVn
 PumOkV4ElBDNg3+WyqzOnc7Q5/msK3ZTSbbBmdQUiDxzJK72g1b5ksPzSTtnuLVOOeLNdVmY=
X-Gm-Gg: ASbGncuwZJmdtw76McN4ikNiiLe40RSIGNpsSfzhgmPN3qRPq77KknsdfEFtpMb8iqf
 ImJQl1cZd4mKl8lD8sUjI4iL7PAG2T0MhlWDuYxn8PAZqyHSenZHGFpCiFKgQVoarJvstYFbMdl
 tffyZr2AYU8mVr8E/7Y0Gx922uF7ssWNKu5bEIBD6wjIGJqCa1PLKNqtR6y/tJt7Hfsiy8ySmgS
 QrHve+8j9k0B3lox2b3OsfO+44oSUsj59AhFKbw7IBqxb5NZAOlmX0MIV4xR2uZ75hTgSUzzFQY
 XUGZUz6Ux1Ye2y3N6io1GPuIBy+iPCcFD3ET+8MN7gxj3j3CH+ElMqWzUPd3q7UV3SdEcUZry5S
 7X4cQ8sXIEhNqtFoCVMewMIxulhbF+wDXqL7wWjkWNGPeP77Iok6n9pTg
X-Received: by 2002:a05:6122:82a3:b0:556:8d9b:70c3 with SMTP id
 71dfb90a1353d-5568d9b7b78mr1297691e0c.0.1761220971241; 
 Thu, 23 Oct 2025 05:02:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI7NlxxiPR1mSCsIzjh6laRe8aVKmqjEwN4VIQypjOlNUn1ZJqRFIU7gS95HufUjGblo+7VQ==
X-Received: by 2002:a05:6122:82a3:b0:556:8d9b:70c3 with SMTP id
 71dfb90a1353d-5568d9b7b78mr1297635e0c.0.1761220970676; 
 Thu, 23 Oct 2025 05:02:50 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3f322e30sm1526903a12.27.2025.10.23.05.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 05:02:49 -0700 (PDT)
Message-ID: <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 14:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX/eMug/QccuKD
 arcpBwyYwHYES43oARgMJ7PzEQgj8f3Ea+cC2okud3IlTyOCbKbwCtYhE1m1VpN1eVAGaibomyS
 rQsvjjzD7LOxGh1kTyaNGN0dpNzTLIy+wMMiyMmLOMX2/OhYEBRelRj0Ylyy4NCJ1elkfWUzMSG
 ygAz5KqW7BuR3Tn2UcWiECpjEl3a/+KD1606PVnZXAhdGbJx3dC+6Cit0XICdavlbEKPtt38usm
 ENI4AWFs+bvW5GSEzpqa7ZfUZZT0k+WtDvBVjyby+6pWKSMgo5Czq8lADwCmO5dcJy36yjyZP0l
 Lz1SHELOM5Om1qtSiNV8fgBrJa45yY7xkEvrTdAAhEML7gi4UJ9WTRtKOrKmWMQZbFabFsJlj19
 T0/Rua+S19n7ZfuJT88J7g8iYezm4A==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68fa1b3c cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dMqN5BQ3aGG_qev9F4sA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: -yDEFREnLTQeeXYo4OMSBIS5bKTrwvdB
X-Proofpoint-ORIG-GUID: -yDEFREnLTQeeXYo4OMSBIS5bKTrwvdB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
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

On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>
>> Add DSI PHY support for the Kaanapali platform.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>> ---

[...]

>> +	.io_start = { 0x9ac1000, 0xae97000 },
> 
> These two addresses are very strange. Would you care to explain? Other
> than that there is no difference from SM8750 entry.

They're correct.
Although they correspond to DSI_0 and DSI_2..

Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
new features. Please provide some more context and how that impacts
the hw description.

Konrad
