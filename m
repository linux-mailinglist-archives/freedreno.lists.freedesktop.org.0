Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968FAC5D8F8
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 15:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4270F10E248;
	Fri, 14 Nov 2025 14:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1G6oICf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBqtei/d";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CBD10EA8A
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:38 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8WcKa1485974
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kpz0T1BtBZTq/unUhKaDeyfGkp7eC3qvwU10X/7O0C4=; b=F1G6oICf9R7etJDc
 qzB4xoNt6ifFDqcCuTHAYPnE2IehvNOrF8OGpNAFvkyZouQatra5WZ8GhnAiM2tR
 Rph1Nz1fGAIif9/PNR/eFPtrDoSQhp7FXvO8++w0S9MpHyk8efx7hVlDhZL1MmwB
 NcOP1Uqvl07rHt+dlxBAfXOZp35dSvcgd6d1F7oGh3ZIJhtYMbB7B9fuplELHGAd
 Kan41oCIfMcdwaTZS597Uokrcc4PVsrkn81+6MLYR63vURQAkJR8seQXw2FJUHwF
 qeDM/rHP26NxrszfQT6yKGoRPMDXnT7M9Zsq9s1b3ZGJBfw4whgsZXR1uz1WS/fT
 ZKaYnA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hte8j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4edaf78da2bso44308881cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130396; x=1763735196;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kpz0T1BtBZTq/unUhKaDeyfGkp7eC3qvwU10X/7O0C4=;
 b=eBqtei/dirrhyfwr8gERVXVkQCYPyf8tnJeVNSRFxo9kdzS6VLH7GdRSfzJHZVz1Yv
 NEDPxzjSYCK2/zW3g6cOhX8ueHTsfGZExfaLP0tUkxwAD1Dpe0q/kSiEAHz4OzyMXyZ9
 6X3Xex4vlll2InVQGJWzJloqkBem18PaG6ToDv+u4mOEin63LTJM71hKKbmUCOSMfx53
 vHALMQWmQYjB34oXELuIH6XnuxJ5I9NG/f8eVZZhTNFa8+HWl2rsRfr4c4s6HVk1Oq9n
 +Aj/UuLpp+XFtANV149qblQq1LnV2sPiJrGWLTACD2+Nc/1y8jutZssYNV86DhyNew9W
 22rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130396; x=1763735196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kpz0T1BtBZTq/unUhKaDeyfGkp7eC3qvwU10X/7O0C4=;
 b=RZQYopopE0qbSLdiAbrmmQ4b5mXBX+rzPZ36TpuYQiyqO267aBnVc6yODUIqI8dcDH
 oRQztsKPiygkyDfxe1XDsSSTNLhWmqvLCmJXQcmHGWiANFo/ZEPcyV/xzxHicy0Bmwcd
 XdOZu3QRu0xgAuARddbxDVPDDPi/vYJ2TroNSZY4RKMhP3zWOTwCNu+sAT2T4hNVsotu
 u2YVhIK62vB1agxYrH6kBWeJF3XHk379iW8m8V+bV20xJAHvaLspzyzRNDaoQToe1G9T
 K6hKfSnLFu7ipCodTQycUfeUHGtyEhm22GV+TmMKcwwhCpQdM5zknH/6TI5QiykOJC9T
 H61w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdqgszlbLVoLiRhjYCW8S7/KKg0mbJFJ/q/KD6/56Ykw8tAJQfTzPrvOjJ8vFDPtwkKjesfSte7JQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8WrbseGezKCnJCuS4rhJmSWFx6je6tiM/+e7k2FmlBfq7SnyU
 b4lEz1j+Ili0Fw00xKbii1mrWuBTdblJ/73nXvETZ0fIgCFXwgmR2usUYKbc4AJ05IB9YF+VZSD
 szoAg8YQ4EOr4x8BhdK6MmkFuVlVKaR8cryERz+h3NpSHLsdH6bKaH+rO1Pi5f6R/JZCM0AA=
X-Gm-Gg: ASbGncsTKEU++Lwt+Gn/ZpAVINRWVrfti4EhYfDNHxiAGWLvBpdDv49ZhO/v6Q2Ujir
 JRC3Fl31hVKPO997OLM2IxZsLOlZCOLKdyMrO7v/4nCCXEZEJ4YiVf+dHPen1XotGxh7pzBld9s
 5SKNJLH2slj5TNg7QsT87NuV47k40SA2DOjQrQMfU3R9juG1nbq0mgfor4yzrTzrlyM1CjWi+mY
 t4eg/7Ol+U6LqRf21ojxrxx7VBHvWgY9mEWrsr1eZdf0dSZhHKS4B1koWPWI7nPX1FJNA8FONBQ
 0ugvqN0PhHWiRKFlXuIRB2B0ZS/BrEAy87isLDwG5381Xf5xjpOfdskvO7ZWYn30hC1uBmtMNEQ
 mQ07649ufvdI5RctxAbWk1kzYY7JzHBuRyp+7/6/l51FmpJrP5imjXwB3pqF/PMLgK0EUPORkTD
 7bVwp337iceDdF
X-Received: by 2002:ac8:5844:0:b0:4b5:ea1f:77ec with SMTP id
 d75a77b69052e-4edf1f4b087mr43272871cf.0.1763130396601; 
 Fri, 14 Nov 2025 06:26:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc1fFvTd3StWO42NTuZKKYem/traozFFvdrNGkyOZ3EfhLQasWqywNOo+OH3TvkuUZYjw+3A==
X-Received: by 2002:ac8:5844:0:b0:4b5:ea1f:77ec with SMTP id
 d75a77b69052e-4edf1f4b087mr43272321cf.0.1763130396056; 
 Fri, 14 Nov 2025 06:26:36 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
Date: Fri, 14 Nov 2025 16:26:29 +0200
Message-ID: <176312947284.1737000.13215688004444717499.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
References: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: anxIlU4KdZc_TQ4l-eKI5gVcOTrzZBf4
X-Proofpoint-ORIG-GUID: anxIlU4KdZc_TQ4l-eKI5gVcOTrzZBf4
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=69173c1d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=cUxZTqMetSfSej92E3UA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX6cbCWVQZoKmB
 HQDxxPCEpZjMG/42ERWJdlry8i5Hd2XUQvxhfGf+dcrkWkygcLyP7o0WE0poPYmTN4qDPc6Ynii
 yzUHaRukzvAAvlCslIDF5Ke9OeYhQoSk5unTgDGkSoJSTzLVNy9QgH6gEXDJ7EU1Eolypqxq52O
 S6SveLrY/1gZTUHz03LC9DK/BXyiDRANl9+8EYVtmO6Cg5fZbzQ6e0nEQtXw1mAcnl5A8UpfvPC
 /5PkWv2ZpEbeJdstof4x9mxTAFzBFMFLYNl+dKlq9L+mm4KeWg9+cyM2KDYjT28T4eyOTF995Qy
 snQkHG3TbUDWAuV6HNCwGdandntCgEZlsUH+JxAU59X+GIFmOaw6uKqvl8rdTiVQ9YbIeb/lfZf
 QQqmNPmPNPCJhWsuNxyr5uyBkWvKng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116
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

On Mon, 27 Oct 2025 15:35:17 +0200, Dmitry Baryshkov wrote:
> The commit a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for
> HW blocks") dropped all dpu_hw_foo_destroy() functions, but the
> prototype for dpu_hw_dsc_destroy() was omitted. Drop it now to clean up
> the header.
> 
> 

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
      https://gitlab.freedesktop.org/lumag/msm/-/commit/34ac2bdebf44

Best regards,
-- 
With best wishes
Dmitry


