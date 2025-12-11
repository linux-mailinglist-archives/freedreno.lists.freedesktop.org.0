Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E886CDB7DF
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 07:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F0410E08D;
	Wed, 24 Dec 2025 06:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0RDG0r4";
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGMORa3h";
	dkim=permerror (0-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dyWCfJCG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C08110E08D
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 06:30:13 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO6PN9D678225
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 06:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:list-id:list-subscribe
 :list-unsubscribe:message-id:mime-version:references:resent-date
 :resent-from:resent-message-id:resent-to:subject:to; s=
 qcppdkim1; bh=2YjurWD8jh8UqL9X0F1WKQTe/Sb7eB2QeGBD5SBBMi4=; b=g0
 RDG0r4GESEo68opF2YrDDlt0BZvwuI3cAgNnc1IAb35ToQaX9eK9zI5j/mCHaDDI
 +BYyKCHqGpcfVxQZOF75hWdLZNA0I+1bQ4cSx7UV2zXvb572P13DmzIA6tUsulXw
 wB51Skn6phUREKObJCWwTtgC66fheHm2CzeyJ7A0VRsTm27eC5DJVgTyZWcSAaCQ
 +50n58YyalWYq2CzshPJfWVuYKb9Z/BFfbQsYLmYup1MZm81HF9dvzg2RmK6kjwn
 6ak7mWtoahGqYlbC+QPzTde3FQ67+gq1AkaUHUOGkNWjRvS2l+9ccsVdai9BrzHt
 0dkbV2KsGfkntHltEV4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq1rvt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 06:30:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4f1dea13d34so128926001cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 23 Dec 2025 22:30:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766557811; x=1767162611;
 h=in-reply-to:content-disposition:mime-version:list-unsubscribe
 :list-subscribe:list-id:precedence:references:message-id:subject:cc
 :to:from:date:dkim-signature:dkim-signature:resent-to
 :resent-message-id:resent-date:resent-from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2YjurWD8jh8UqL9X0F1WKQTe/Sb7eB2QeGBD5SBBMi4=;
 b=eNTffdwyz602mQtvazaDplnzf0Opvg/HOQpzYspxid7oLYDFtN+j2+emDDSe4QX/xm
 AOP9dydBCCoVLmUbbL7kyI2BO+m4rYbXfODpuRDD/Kj/n3Q1hgFBybL7Wn3Q3sWViX8h
 mPiwCG6IzINzJ8c3F9m0GoOuyHc1b+YB1rv+wihTooaGkN9xNoPlDwPWnwRBVL7ePQ1S
 jS5Sym3RCKY9rj9irmhogEX805gAB4+0zX0p1JgXxNrSzESwjBlArY6DtUn96Xp2CuIq
 Tb6xf3uR+lYQfoYpFfuGgzF3lK0fyLA0pA9PykXpPS6itol2Fpx7YbA4H8XdapCACpdJ
 M6zw==
X-Forwarded-Encrypted: i=2;
 AJvYcCWjCk3Ebx4WrlI3C1CEgQOhgsqO6rUM/uVAtd3rGQKqzmWnk2jgFKRgIsi7aBQGAY3gm63uaU+k97A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx2f0mYYKVKmhU3LmkbVVV1HGH00jFto8s8vgiqV2XCYM8JctH
 vLBlhD+SI29Qi/lfIKUlwNmyyo5U/NupmENqRmWagir8liceTGq15Ggq8/w9BLDbULNji1aKEGX
 bacl8BjqqmG22nqzKCxLBZZMczfJDbOqdtdmBb8S9kkIMq5o+QupF3WH5Kz/SfvGvsCTl8F5WBH
 9u3vE=
X-Gm-Gg: AY/fxX6rpxNSPlfyxDlw5JIg0swZ6jnmyc0o9iBgvC15A4hyDEN9sXQwyMyDt/h6fFa
 h6aij6Y4ri360ZS5XovBfrRJMpxbiJxMGFx0Xmr7HjI8cAzaAmcU7wULn9MCSzjHc6WWs8tfsWD
 t4AWBVo+Ej5RVeHNiVW3Qs00r0k7OW2farqDKaFF7NwbbyjYwb7Li4cM7DuigueKRzV6wE1m0NK
 /OkHlyRUWhjDOjh1rdFvWb34AvnViuOwhxx22SME/ceT+3RArwXRNArNQfkWa36pa1kvXjUa4wB
 hXIJugFtUgav8Y6L7+P5S1t/UAklHlj12+uboKr9tnNvN6Xq9WmX9jkqcg+6+kNTDAtYxocetBI
 ncJ+1moM+oI5GRkVZ+oqoezVhdpZul3SVKAmgupQJODjhqw6a4cvVfvARigvNZ2lxzvGxpqtX0W
 5GifP2ShEnL4NZdQhr9ZCp2ew=
X-Received: by 2002:a05:622a:5448:b0:4f3:5eae:b135 with SMTP id
 d75a77b69052e-4f4abd797dbmr227874531cf.47.1766557811299; 
 Tue, 23 Dec 2025 22:30:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtrYuldAqff1SIDl96UCUt8xtrEBMalD+B7Yqs3PjkX8Pszb4dcKhkI+xKd2uofQWsSlevTw==
X-Received: by 2002:a05:622a:5448:b0:4f3:5eae:b135 with SMTP id
 d75a77b69052e-4f4abd797dbmr227874321cf.47.1766557810817; 
 Tue, 23 Dec 2025 22:30:10 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185ddbedsm4772721e87.38.2025.12.23.22.30.10
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 22:30:10 -0800 (PST)
Resent-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Resent-Date: Wed, 24 Dec 2025 08:30:08 +0200
Resent-Message-ID: <migrmwyfgovathrk62e3idqb5stleimsrpiq4yktk2fbdsrwzj@jkcornepittv>
Resent-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6082FB0A9
 for <linux-kernel@vger.kernel.org>; Thu, 11 Dec 2025 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1765447042; cv=none;
 b=FoB10esISNiQO8VsCUTrrM4vpCm5iH+w4FqYZO4zx5e05XGoKr3tdDr+tgLYwpBW2QTpnl1JeZl5nbSnScAohYTVyKVtYysQdEn6w5Eiwb/r+TSwKfVciIOKh46iaKjg9dwDJmliweLy23V/72n1Qxl8yQAtWSauioV4gia4oAw=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1765447042; c=relaxed/simple;
 bh=eaaCpyMI5gJRIY0y8iNjNydTK5JRo+vQyoZhOeho9zo=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To;
 b=pt83OA3FTAUPtoH0S4JbcsFZrWIuJNl0JX9UDrA9VOv30Rv3PMC6Hn7jyEFwTAsahVzA5zfm/DageHJ0yPdKUslgw/aZaFUcOYewU7mhKNGax4k7bNzUt9u4s/U7bROAwnxg3Tmt7x1V/ozPBE8h50TjcI3q2dDAG0DaCOT3jV8=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none)
 header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com;
 dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com
 header.b=LGMORa3h;
 dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com
 header.b=dyWCfJCG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none)
 header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com
 header.b="LGMORa3h"; 
 dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com
 header.b="dyWCfJCG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BB9ZVGw343005
 for <linux-kernel@vger.kernel.org>; Thu, 11 Dec 2025 09:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2YjurWD8jh8UqL9X0F1WKQTe
 /Sb7eB2QeGBD5SBBMi4=; b=LGMORa3hIe0vRuX9KJi4+Vn1SOBH5IGz4RmQag6W
 h1EX1o3Ga3xKpb+G8FkdG1MbCFtO0bxLygomtve2Nsc4XZk/DydoTYmRtPBP/imw
 qqmarpbO0fOo7DHkT6c9qu8GvsFJuNpAldoE3ozfYkYjaRtXv6Lj0/3828V+3IAU
 NYuetnZjYgc1TeYBX5abJXlKZrkvdpsOIRMdSSS0RZjzc3yJlE/B0ErftH6Lqd0a
 ZTd4B+k5axibE9SmIOEEhXtBeaRs0Yc3ZTm1s7Be+x6YRGwier4GcNKQtXqrVcnI
 tJgP6pY8JMlFkTOBmAW8qYNfGt4lpiuQKTqTiU3GlITuaQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aynpvs4tk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-kernel@vger.kernel.org>; Thu, 11 Dec 2025 09:57:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed6e701d26so16446341cf.1
 for <linux-kernel@vger.kernel.org>; Thu, 11 Dec 2025 01:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765447038; x=1766051838; darn=vger.kernel.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2YjurWD8jh8UqL9X0F1WKQTe/Sb7eB2QeGBD5SBBMi4=;
 b=dyWCfJCGqYLYtsGeuJqt7tRGpg4qp24CH2fiWmZ5avk8xolctjyAxG8ifkvBBREdwd
 2Uomb9h4/2B08ESJ4lKka7cnN6TmFig5HDMo3meXtkv3QHK//un9RYi/ScTtwvYTuDY8
 dEoi3C0OdJYalb4BR8wH1w/RHbyPFfdyH1yQ+dZCsTcS+/72FiIEHjSON93w4AiK+Vxl
 XAnP+cD4dCCtIT/SFdi9vasuXRCOpOpb0SvdzHyzXq0+/WmvF2309MZTx1fofVUIRi5m
 +UpxpQnoQow+knhVo0QlhxZex9G/KRdrgHREj/BDS2ca1JerwnkwKhyDtACIROUfklBY
 5sRw==
X-Received: by 2002:ac8:5987:0:b0:4ee:43e1:e591 with SMTP id
 d75a77b69052e-4f1b1b4813fmr74174111cf.58.1765447038313; 
 Thu, 11 Dec 2025 01:57:18 -0800 (PST)
X-Received: by 2002:ac8:5987:0:b0:4ee:43e1:e591 with SMTP id
 d75a77b69052e-4f1b1b4813fmr74173931cf.58.1765447037842; 
 Thu, 11 Dec 2025 01:57:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2f379bdsm724574e87.2.2025.12.11.01.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 01:57:16 -0800 (PST)
Date: Thu, 11 Dec 2025 11:57:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nikolay Kuratov <kniv@yandex-team.ru>
Cc: linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Jessica Zhang <jesszhan0024@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add missing NULL pointer check for pingpong
 interface
Message-ID: <72epnkogfsguqyoefmfawqw7gr2molejceqe6rvunpcfrw3s6r@75wvtvd3btjd>
References: <20251211093630.171014-1-kniv@yandex-team.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211093630.171014-1-kniv@yandex-team.ru>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110075
X-Proofpoint-ORIG-GUID: nHoJgGprkTXyHx4-N2AjmdjfK4xpBOmi
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694b8874 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ihqtQN7mmqmTXX9nVePWgw==:17
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=68fdCqVM_EMA:10
 a=s4-Qcg_JpJYA:10 a=SKaEv8EmnvEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=6R7veym_AAAA:8 a=EUspDBNiAAAA:8 a=q4VHR2A0D8CO_ZJfzXEA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=uxP6HrT_eTzRwkO_Te1X:22
 a=ILCOIF4F_8SzUMnO7jNM:22
X-Proofpoint-GUID: nHoJgGprkTXyHx4-N2AjmdjfK4xpBOmi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1MyBTYWx0ZWRfX9/FhrkgaP4Ym
 ysFvwX8V6FEEu7jPZ42mHMYK8RYxFrZxlWe4jmF0lENJ6Z+DZA4+w383krr25xEbcZPZ9SFt59n
 HQaFdSXzJz70EjEL/pfrZIJoaBhColFefKLFBQxAWy9ISa/CLaiZMN5e6iCy3UQQtZOuwS3pNmt
 A/vcbjQ2n7YyXlLSB+4lobjn5eTlB6pVRJix2e/j3mgw6SilsASXH4rtJ0AylM7E5lvwtfzBqZr
 70hI9i7dtMZrITV45wCWEGgLiKxqt9azQ9b4ambF4oeSGb0ifW9PCP0czRgrLTr3jIiG77VkZmT
 vwghcnl1wJgxGA8YFdiGxlMp1DleR6nLnBag+0xxfRMIf0AMcGtx20E7DeRcpzMXAMEFCl0Vipr
 0KuI7sOJ9FJWwuITZyg7CdvnztuZfzlKIo5XPIlHYpPDW1nb3U8QS4gPC9A3k2ks3A+DfkPC/hE
 V1AWd/ACitGvjcbZpDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240053
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

On Thu, Dec 11, 2025 at 12:36:30PM +0300, Nikolay Kuratov wrote:
> It is checked almost always in dpu_encoder_phys_wb_setup_ctl(), but in a
> single place the check is missing.
> Also use convenient locals instead of phys_enc->* where available.
> 
> Cc: stable@vger.kernel.org
> Fixes: d7d0e73f7de33 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Nikolay Kuratov <kniv@yandex-team.ru>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
