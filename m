Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD461D12278
	for <lists+freedreno@lfdr.de>; Mon, 12 Jan 2026 12:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B902010E394;
	Mon, 12 Jan 2026 11:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5ZYtTpZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bx+v6snX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A132110E395
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:06:18 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C7OcTX555254
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8afs7XBatBRPfjZn/K8JHD8vDykz785GYcRAb1f0hO8=; b=T5ZYtTpZSe2TzbqX
 6JHS/5mADeL3Am90SylVsj90XQWwXfZbUbNv++j7poNfVC8QaJnqJpzODV8Rhcub
 7fqY4BTsGRpi+33pBSLWW/1JjiFc/8+kPP0yCui4u2tXdofpvUTlVMuVN1QNCisQ
 +8Y7AaGbpxLRkX9PiT1aXYo21ia+uZVvvIYYs47aCkV/MQVq76fJrwE/29KSllfj
 sIvpOECx4kGx6d8IEWtnMJTkhyZQdzQQ4hJ2b0ehBqI6YmSbhx2L23LvWKJJs3I7
 tZB6YSTpsIwF2ir1kOQACDew1mqI3d5mHns+QJSAP8BUp39JC9B1reQ1LJRSX1Tp
 Kg8NlQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw0qxx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:06:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee05927183so11588551cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768215977; x=1768820777;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8afs7XBatBRPfjZn/K8JHD8vDykz785GYcRAb1f0hO8=;
 b=Bx+v6snXvT0uMmjAXQ49+viRzAP211WAdiH7ns4Y9iUOGMYgssGwDtjECME6bWajTn
 fbpS1/meths4u4YpU1FefiynLgogrkxVvxo6grZm7YPMvRYI5rYhmsc6omJvtJykN8q9
 vBrQiHfXfGivCqHRcJBVM/p6Ghr+oWQecuRNWBOAk657cpoMg8PDNLd9Jc0W2cm7mjZE
 /wGJD5rXfpecvUFv8EE9WYKONus4vH2BfJ1+Ofz39alY5zKeKdYSBnCu2trcmpjWZByQ
 Zp4vbn3pt7j9gUOjw4UjSsgFNpH2gce7JO+umtZagJckFkv9hcaOLU5YO6rhwFYWuXwp
 ssww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768215977; x=1768820777;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8afs7XBatBRPfjZn/K8JHD8vDykz785GYcRAb1f0hO8=;
 b=oVSr1l4JYUnosyDjOvDnSYOqfihqbsFN2LuFqGrLUPLd8Yf+APeGa8DqVvHDMJXF5f
 TTlTT2P7dqgJjab9hd6RIWA8KLUPELCuapcqTW6VXKtRGp+wX/pLBpib+qsakne5y56+
 GOWpZPsE23O17j0Qrk0UhDjFc9dVPqhbxUQsO4rNZ4vdUiSAC2CUuopW+FkAH9jAZqhp
 5wk5tAdBEadQXje1bTIUHySpbQUyp+uhwu6rBt1FyTHAUh05n24xQu+UckUDVCCB72jp
 uenpByyVO/Iur6cHOLNHGEQ28OvDZFqGmAtJw/ssqYu/4psN6T1ACRMC1pkYUHEwi1nj
 ingQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm+LWcrY18t2Tu1CbJtUMs6C3+sFDhHXE13rBr8Eyp7nMY4zC5rR+OPjB+XE435y+N5C5vQIZXdNQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMLXbhv6d5j0nxAyiWkA/Pu04hVHV9HiTjXS3XfZPpQFCpVriV
 EAVeiuQdktN5L6bj8+qw1IvayCtORMVjrW305sSfKz3pD3ex+ErhDe933KsKPKcdTTzy6/7Ihe7
 oxcX6/xV3q6OfrWgFl7v4CHKyZ9UPhi3h2djVP3EhLVA0CRDDLX8NSp69tnEJsGhcAo4itT4=
X-Gm-Gg: AY/fxX433c09+ifcIJELQgKB6V58ELgIUgwdjU2nGe5voEVGaATAZwSASL3qkFd86Cf
 qbGuKz3kPsIg4/nHFz+bKKGHyxWvxfspOjsfJ/LAlR+MCZ/q+5MJRsVBmgpztrlYAV7g6IAL2Ty
 M6GiqAizjzU0S78dOyju6ixz50/3vh7FFpk2GY0CV2bYcNgR4u60NuIlPUs9PRydii//+1AG14j
 PsfMFVHZO24uAuneDsd2qiFqZfm1gp7ATU52LOX9WDE9qgdl4Km42qWy2l9VPBzqwMsBSu1yoma
 +v8J/KngWP9DOPS+zMfEPyqKe+oXv3IBrEkf3jQeB3j8lIBVbIhUpNHJftFH5t+LNr7+itZtz+l
 DiHME9Eg/srqsyJUYgwKyjLUv95QZc9BPH4lD6BcIh2k4ESxX6Y7VoPx3F0mout0TUNs=
X-Received: by 2002:a05:622a:1890:b0:4ec:eec8:e9cb with SMTP id
 d75a77b69052e-4ffb49f6842mr188340981cf.7.1768215977114; 
 Mon, 12 Jan 2026 03:06:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoROZPkrFaKwWGha6CXTBLtHxCU47doHYO2L9KQ5RvLt9XOFT6EtYsvfRFTpRB9pmoi7emoA==
X-Received: by 2002:a05:622a:1890:b0:4ec:eec8:e9cb with SMTP id
 d75a77b69052e-4ffb49f6842mr188340531cf.7.1768215976475; 
 Mon, 12 Jan 2026 03:06:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8713416418sm381115666b.49.2026.01.12.03.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:06:15 -0800 (PST)
Message-ID: <9c9ef8f4-8305-4151-b079-f24c8cf8d51b@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:06:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] media: iris: drop remnants of UBWC configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-9-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-9-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfX9RAJAvYJY2CU
 2K4V5byzcYsJ45z2WlbQJscoQqhKws7c8mO0qx7tEAXVAuXvel/ldntpmoLfUI5DctK08J/W91s
 bzAgT4WwrZlfSqxRUF+TnE1Fy8DHIjEC3oRvnPd/MHxHIFP0BccnsjZGbBtMyI8wQax/hi45D8H
 q1B2mMJusTmISaCCQKWEybTVOj0NKg7qRTNv8BihxpP/aUDbmLKcvROK8YnrfdZUYsGn39BpS0n
 GkIm24DMKZRmp1mar8ayG7q9HqSzj5QVSh5027ASDpLZ9q9jI1JO9IHTqrP6XKkImDtqiykJ19x
 xsG5ED56qvVIxCs2nHhEqz/+LgRQSd5MjK9Ue0BwKx/11OKi2q57a7+1vo4alXmOVZSigg0DLsf
 TbLwspCh7L5r2B9OU0vGMTK9+XfqUm4+9D2jETn6Zy2kSrSgDsBPgmp4NAZr2oX4BmxFrqmlSy7
 5/YNvoKi4+8Kd4jbGug==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964d5aa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FQNS5iDjU0T2HGSwfYQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: cvDCLce-oAa5MdDZuiLJbWfnN_90XDRk
X-Proofpoint-ORIG-GUID: cvDCLce-oAa5MdDZuiLJbWfnN_90XDRk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120088
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

On 1/10/26 8:38 PM, Dmitry Baryshkov wrote:
> Now as all UBWC configuration bits were migrated to be used or derived
> from the global UBWC platform-specific data, drop the unused struct and
> field definitions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

