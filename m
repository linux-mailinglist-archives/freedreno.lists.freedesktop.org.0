Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAB5CDD297
	for <lists+freedreno@lfdr.de>; Thu, 25 Dec 2025 01:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14267113CF0;
	Thu, 25 Dec 2025 00:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oeeaece2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XorhJFvJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D0E113CF1
 for <freedreno@lists.freedesktop.org>; Thu, 25 Dec 2025 00:46:17 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BP002WN863538
 for <freedreno@lists.freedesktop.org>; Thu, 25 Dec 2025 00:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JOjQHtR1y2v1403nVUZI/TN93ZvCJctn5qaK3e885+s=; b=Oeeaece2MZ3qzFTt
 7NKGkQzV0oPQKoo8SlhKKfk2ysifxGsgRQtqnSVYs+cp1yPIcRsXGNQPwAbmyS9c
 Pt5N3vtFiFS4HHAb0052LrkdcgtLjRkj9CJuZi+mTn7hLpzToguYk+gZbnmRJ65S
 CfcgecR5XN3CyLQg73ed21wwB4o3mbtyrT658sdxkhbZ+ICGY/g7Yn7CT0Gu2mqK
 s3q1OoaJ81amfAn4QPIVIStO1klV8CksbY0AR+cM7/Q4pqxWyvVZjAqwZ3xSMFW1
 FZTCmXDbwzW1SoaWSfVtoYYy2GJ+8G7Clbd7loGMuz1Wi64vJ3dzJhjWlM8U0aMI
 QNEKUw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2mbpu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 25 Dec 2025 00:46:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34c6cda4a92so13297534a91.3
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 16:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766623575; x=1767228375;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JOjQHtR1y2v1403nVUZI/TN93ZvCJctn5qaK3e885+s=;
 b=XorhJFvJFh2w4oM0U+lN8aplDO3E93BAF17XSEMt4ICpPdGPrXJEFoGcJuQmIl/5nV
 yZ9nWeY1SKNjBHZ/nwlUqhqnSK0OtMvuQ9rlVLG+SjnJUdy7tCGvQeTuth8hXg2C8wN8
 ONUf/R8RqPKt03Ik4slnNjFrD7gJjdaEvGr2OpOWUAUleB9Fj35ltkyJhE78Wcozi3Qm
 RZiW2yypx+cF66u8XNIYRLSWhQNsSb8+kDHGvzFi0SC+jST8pP3fU60JEScSIUOScnHH
 2SK2ZyknqLwAg8FPx8gnWKomFX2IDz223dIrLKsYAVibo+f4iGbDwJoip50Xl93swRIV
 vGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766623575; x=1767228375;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JOjQHtR1y2v1403nVUZI/TN93ZvCJctn5qaK3e885+s=;
 b=XfDgcOkLKS58xSqaeevI3SpWwKSI0nDQKh2/n3FKQDk8RUOzEHy3wLKcFaRRzs5gDE
 XpPfDQauHEvBWmBK1vXNwEfJeHsNObY9gVVI+pYPwuaMHrCnMN0S0RDGQFmxUIphyQok
 55mIG9f9MJX1h821UqOt6Sm1P08CNCQ8/3iDXKvjotleJZVmzGfXPNKzRMbXOTA23e77
 KTjLE5+5ANapwwxI0TthM1IuUQm1hkaSg5fo0n/vwciOFmUMFl2GeM8MWskstFJNdaon
 Ajuh70G8L2wOP8suxmmmrkisj98NDzYNAmmCSUXns+buDhNZoqCEBKE+J0SExkX/Jkl3
 ZHWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcLn+cHOzK9ViBiYJKkGvKheaLFsVCHKFO6D4qrEo9XDO3VactCmcg2oLwn9xIYm6R4FLbJvmSeWs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx60VOzOjva0MAlUAUcsY4gGJqDTz7huYg75EfwvP/iXd+eEYxQ
 pS5HJ+x/msH5SDaUsSC8UjjJl7/NtjyyJCrZs50wwE4DYoAC/ci6bnRnKxyHr3uCaM6VQ/iRuHG
 ogBDIeipyt7SjFBugC6IRhtUMIOgmm0Hk14enGa1aBBrokLdqSe25cDm7xUWsEJqx7RkRJOA=
X-Gm-Gg: AY/fxX7pAAfmnDH6/mjxTR9r9MdQHjke7cXnzVAqBe9JGQaJyNfi/WqLM/vTOROjImS
 bMQyk0so4bXBk6eOvZAmCzdptu8WsC7UcUSkb82gH0gk+Cdb4JtA+lc3aaT6I+XEK9fRH7QV7c+
 1KJpk5FjhRD2mvU2luay9ydX70Slh1XKIwux2d9Xj5LE+x3s94iO4khw7n015xe+JtP/7pR6sqy
 SjTelT/G7WD8kYDKurtSOB7Z3bsrwiTPVKm69/GapowfkMcECKPRzOKp68EsT6KrngDrz5jbSLE
 nMvcoEuJ2V4CRK/WuZp+RSkhvUZfMN0JLFmxv3kQOv/qe5NDIXW0MZNP56mCqVJPBsYDwG3Toyw
 8MfdOClDS50asXhO3NcdFq53BnihBwsefmJcP
X-Received: by 2002:a17:90b:582f:b0:340:c4dc:4b8b with SMTP id
 98e67ed59e1d1-34e92142aa0mr14731703a91.10.1766623575159; 
 Wed, 24 Dec 2025 16:46:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXP9A6tpl8ucIRe8Ods2JAIDC87if9iUX4kBKrYAcnz4tFgm7QZa8EUdMVTSrI0HLbzd6muw==
X-Received: by 2002:a17:90b:582f:b0:340:c4dc:4b8b with SMTP id
 98e67ed59e1d1-34e92142aa0mr14731687a91.10.1766623574691; 
 Wed, 24 Dec 2025 16:46:14 -0800 (PST)
Received: from [10.216.32.21] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e70ddf58dsm19645493a91.17.2025.12.24.16.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Dec 2025 16:46:14 -0800 (PST)
Message-ID: <ab947157-37c6-4df0-9242-9d251defaced@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 06:13:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/disp/dpu: add merge3d support for sc7280
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251124-merge3d-sc7280-v1-1-798d94211626@oss.qualcomm.com>
 <nw6oxqdeoeckcqk4lycxyujh2uk63vjdzdpaddddkjb257xldx@eh36fawnt2an>
 <5ucbip23c23z5cpoevo5uxifl5de7mfipjfkhblyiw2vbxv3j5@h464opwvswrd>
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <5ucbip23c23z5cpoevo5uxifl5de7mfipjfkhblyiw2vbxv3j5@h464opwvswrd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDAwMyBTYWx0ZWRfXzvx3/ELWutf8
 Q7bkY2ng+3V3rgpww67xpfryahLSoTB3mrD5kFy0qhLgSm63QUaWf6J1Eq+Qw908ttWiZR0VOyB
 UfA6j0nc9y/Tv5wDhPDhOpq1gHF82Bcq4ZmSPP3h5E4/xFtyQVbX4F++OmEmSA/DfMJ92KKYQWe
 MOZHpue4gW8w2s4JmAdyVs1selhrJe6AA7mCTpEKLwtvrdrRvpZbhCmpacfexqLyPMVMrjPRZ1U
 YWajSyOToRfq1F3UENOGDLw2GrIhkOV9w3x6X7qegI8ZDEFP2Ct1117NWC99KJKHCH5k9NrcVps
 jEeDoUF9PttKh8lYXIqw5z8X0wbhoJBV+OVggxZH6ppptsBOoRNcGRiNQuK0EPyprCC/8stj9AB
 Lx5HzohMgP+3zk1IZdtEw4tsqjjFZqgJLf5ZOYFtDFm3Nu5d8J/ThxEGckwicIws2eVmUZPSo2Z
 dvz/lQf0oPcM9E62U3A==
X-Proofpoint-GUID: ypeP5bkBfszrP-E2gEIFG1UHY45CIcqB
X-Proofpoint-ORIG-GUID: ypeP5bkBfszrP-E2gEIFG1UHY45CIcqB
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694c8958 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Pw9t7XW4HU1aVLqCAW8A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512250003
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



On 12/24/2025 12:05 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 26, 2025 at 02:32:41AM +0200, Dmitry Baryshkov wrote:
>> On Mon, Nov 24, 2025 at 07:57:01PM +0530, Mahadevan P wrote:
>>> Add support for the merge3d block on sc7280 which will allow
>>> merge of streams coming from two layer mixers routed to single
>>> non DSC interface. This change helps to support larger buffer
>>> width which exceeds max_linewidth of 2400.
>>
>> Please see Documentation/process/submitting-patches.rst.
>>
>> First describe the issue that you observe, then describe steps required
>> for solving it.
>>
>>> Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
>>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>>
>>
>> The patch LGTM.
> 
> Mahadevan, you got review comments about a month ago. Any updates?
I apologize for the delay. I will update the commit message as per your 
suggestion and post the revised patch within a week.
> 
