Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D242CB16E6C
	for <lists+freedreno@lfdr.de>; Thu, 31 Jul 2025 11:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC0410E740;
	Thu, 31 Jul 2025 09:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9/WzznN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596AA10E740
 for <freedreno@lists.freedesktop.org>; Thu, 31 Jul 2025 09:21:29 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fO2J003694
 for <freedreno@lists.freedesktop.org>; Thu, 31 Jul 2025 09:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YKaZRpzTXWacG09Osv90jCxKbdHhzZHJjXyXniyeau8=; b=W9/WzznNX7wf3bVn
 78X4fDfQWP+G4fVjX5RCjLLMJDMwYF4oThT6Dw1aFomF3a4dw96Dw0bhCC1qWO7d
 4ZRyIkPpan7q654q4SyCbxCzfrRUUYLH0BVjKGuFoh6JVMZSeFC9YleYNCEEHb3/
 W6xjDHor/kEBI7SeO+m/ch4PzErSvcaq4xhg1EzYvFhz76odXn9nadDYjcW0H66F
 GFKLMett4EVPpMiLM6M3abB5/7VK/LvvizszwxxNJz+yw4R0tmhNvyZlAVw8vMcH
 psHHoLtx+gdjjdp1nZ1+FZBTFMyf4/IV5PDzK1ElfU44LBg4N5gvPdh3e/JtvhSV
 WJWocw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm7025-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 31 Jul 2025 09:21:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7deca3ef277so24631685a.1
 for <freedreno@lists.freedesktop.org>; Thu, 31 Jul 2025 02:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753953687; x=1754558487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YKaZRpzTXWacG09Osv90jCxKbdHhzZHJjXyXniyeau8=;
 b=l6IZ+3iKiznlIwxqrUuJFVf4xarlKhveGpti77BlWDVA2QL6EmANRInK3wf9VfsxIb
 PtOpfRQWxNnkHzlpCVjd8jZXnDI933SyuLKibcCc4ytMMbTOcU9Iurhkps78xPWEeKBX
 5nK76yaLbHDu3FNxDMgyOSxM8pk5aWSxatZ5a4/KjMla7nYc1AyTsi8ExOl4ldracs+J
 4o6x9KhZrdjmUY5/Q+vF6/j5GpgByrWg7RMcw1bK79SnoKHKL0SZyWx4ibX6JgfVtLhp
 Je+5jzy2PmoC2cIe+QEEi+SjfNO35LTIPOMKWBnz816VxgGpjJszyFxKkeqSW/bT2Oka
 dMpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCkgE1hMoOZH5GwEcGI2WwVtvy0nPqxu9aWMeSOqYrCJqMLThoKrIHq0JpB3NFVxe/s2ZTPDMPncw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4Y9dsb8RtTvoQ9Olzy8aYKQyUty/6zov2oQBGtVY88ki7JTA+
 /diQkIhr1wLD/i+iCkRSEUiiITWGNlnx2Vdjo9AyShffa96pGxf+nO9ZxdVsQVRzff1qE/a/Hwf
 DceSYkkxvQjBs2bSv1rF41Q9gMzzAm5VV0LiRxMVRdPMCubxoSRv18e3esAKbNx2tqC+PPqw=
X-Gm-Gg: ASbGncvWsDSUykIoxrBpfn+Dr/isc7hLW3T9WPdx3lFXf5KxFYVYKWkVzOToKlEASY5
 sUGps06iJugPuGzd2CIh14/+Q3TgEI1RGQY29zz8lpYJsQ4+1xc5DlUBjcOjHJtfyS+bHNWRNjq
 igZLhxllqZdavD5d234Oo87xVtgWHcvd54LqsUCho4e9gOlxePnntaPB67Ahr2Of6LK693KTWS8
 ADeUX7woMmedJP7G3tLA38y4vSzend7PB989oEGxMd008koJg1N4JMKG6qTTzOluLXQEP/myvhY
 GNr4bIxOCyza8EMYp8tipuLB2ohodKHZQz4l1Z3gLe4TeE42OAVHoStzFD3hpdDtFIwio8rGSWU
 wPxxOHlZwxSCghCq7lA==
X-Received: by 2002:a05:620a:2546:b0:7e6:39a2:3ebe with SMTP id
 af79cd13be357-7e66ef831b1mr477644585a.1.1753953687516; 
 Thu, 31 Jul 2025 02:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEalnbAwcLIJLmez0p2ygenNgK4rxww+Q/pnP8/kWW85eDmOZo38Kalj+JOb4MmxyAgyaqYWA==
X-Received: by 2002:a05:620a:2546:b0:7e6:39a2:3ebe with SMTP id
 af79cd13be357-7e66ef831b1mr477642985a.1.1753953687115; 
 Thu, 31 Jul 2025 02:21:27 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a14a0sm79370966b.33.2025.07.31.02.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 02:21:26 -0700 (PDT)
Message-ID: <b34ae465-c227-41eb-8492-4a2e761cb3f3@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 11:21:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2][next] drm/msm: replace minor->dev->dev with dev->dev
To: Colin Ian King <colin.i.king@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250731081854.2120404-1-colin.i.king@gmail.com>
 <20250731081854.2120404-3-colin.i.king@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250731081854.2120404-3-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=688b3598 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=fM4dGe8XGJNefiYG4oUA:9 a=QEXdDO2ut3YA:10 a=LXDWoPVop_EA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA2NCBTYWx0ZWRfX3O4eD2QyK6jm
 uhwUqVDdRWdLmgJcFyFYKXNH7wJsuDOiZ3LCazR5NZLKLhR7qFj79lZTByGWUxq/SBERMbs0ToD
 qt7QasdeFvUKfRdV6iqYrtK89t+XzTOzwLkgGWtoKgNxJHG9nY8br4/CjWWjCBowHFQQrG6/Xwr
 xGBBohHFYVr14JjRGw3sCIBe6xhwuxddWXpr4plo6nYAl+kbALN5+u1GEx1brtZRfIXJGXXkDA2
 JMTRnmXHSt8Rs/v9CdeWCZ6Y2XBpB9wfgH3mISH9Dajru/XibkRE7FlQBxp/0At8LtOrcHsNigC
 5dyZUc5MTZ4k8mnqKv/KlWT8Vf+bcHKZToVYWchBR5Baz1s30HXvPVyGIN5oD9DVJi5br/n4m+c
 HFiUGGbpFSVPShTGVWpyR31Id2/cUXRjefRw9dri2l70Obr0wIKd94WCnpyFAF1Q1kKgEv3b
X-Proofpoint-ORIG-GUID: nnwv4iOToXkZVwsyziA5cWdgVvNsJwnr
X-Proofpoint-GUID: nnwv4iOToXkZVwsyziA5cWdgVvNsJwnr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=692 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310064
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

On 7/31/25 10:18 AM, Colin Ian King wrote:
> The pointer dev has been set to minor->dev, so replace minor->dev->dev
> with dev->dev in the DRM_DEV_ERROR messages.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
