Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id z7gELpMjnWkkNAQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 05:05:39 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527501818A9
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 05:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F2410E4A7;
	Tue, 24 Feb 2026 04:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCRRUHKZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BbFd+JFn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9513A10E4AA
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:35 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O3LYGn1627332
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C4fvuYxVjNpUmJ0ryko/nP3p8aeV4LlMrsvq7BoATTg=; b=VCRRUHKZyEj7g2Ei
 o1jvMPoTyrzmXILs4k2jjAWaKDlXMNhXetJsHOd6NgfO5Q5NFc1VscLgsk7Aqw4+
 1UajcLaIXaPD3Pq4AQm/vqcdBaD+58lv6LYAFB9sMorLNRMdK6nbr6j7NeB0MnY8
 GV/zYWBsvykHROsJ1I1fiA/g8N+gytAF2eM/KRJdYTheEunZsHl3Z8EMQNt+GSOf
 mjbV9m08EDPgopYSeU+9zry6kHn5ffBmRSxZ8+VuomAtglB5jwEIkwMyEyisil11
 +7iCh24mheFK8U2qva3Ijc+nvp9y0TrBcx7LaHvUbnfuM6YEczI/0xvYA7tzwoHP
 FlRtVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn81au3p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb6291d95aso3560594485a.1
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 20:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771905934; x=1772510734;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C4fvuYxVjNpUmJ0ryko/nP3p8aeV4LlMrsvq7BoATTg=;
 b=BbFd+JFnU+aX2CH4avAcNCZq1wxsNS+Kt0lpyeeL8g4jM9q3UWKK9uUITL+pqbi9SB
 jFw1CCzuyvlzr2bofRDfXZFDpL6nia7O9qi9VBO88O9duCfmUspLoM9p3pz95Es9gCyY
 z9RGINZhA1m1DF8rcj247w530uDyRdS5iqk7zyLdCQDJVpsXCryIG9i8pFl3agFkrqNy
 z4fhoXFqCIgx/8kZO3E6a+iDnjksFOCSydcoKKifiJcNtKWIt02GdePAxTj7ZT57rMTv
 Z/RUKU3HhvqbXLelO3kq7EGdhPq/sZkK6+0f25X/hSDEdDsZ9x6/cvGVkqfP2UuxSrI0
 QJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771905934; x=1772510734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C4fvuYxVjNpUmJ0ryko/nP3p8aeV4LlMrsvq7BoATTg=;
 b=NNBq2J3oacy84FaShd82ZFYcevbtHXUttkOgq56QU0c3frs1jRXsN7YSe7WYnGm+P+
 6epOKk3DSQ8giLksqjb208exjkXjOV9v5kN+4B+Q4OxuR3geUb4JCRaGBiE0Lhl8Dwrs
 /arfXT9WKU5Jtz2fYhYZryIpoPiPROD1+m+Sh0UHq/9PPDfLjvwsB3C0N9tBL8QQ9vvv
 ntDzO2x2ek4RocTzzuZd5sayV/nY4GlnFShyCO6VvunoLlSml+hzbhfptr4lsoiNxMAl
 MPSRQNK+otnZyklqBkZZFcRDTYkszEP2nSPNXPsftKXCHaAXWYRqbBM+B3YukppKppaA
 KLgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEh+I0OjEuenUDdOsuODHfioTznPmuN1dbn+/OiVy3doScDdCjSFO2JkijW+pW/meNv2cfGP8FQjM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoqKNOqyoNdxaDIvMocj8vzC40Fpsna0bDuCeHPFmIiWxCpRqc
 /OwesayQUUyJCZDAT2JQFz/bE0mJ5Lb7J5tCT5LhCDVlRiwmYX6xKd+Wk84VuwoyNvNmNT0fhKr
 YT+FmEFsER6BCf8mhT8R26W/JA1P0IebiSIoYyek45Gy+8qA0TcGqCLP9Teps0kAiiUDc4QI=
X-Gm-Gg: AZuq6aIo8RSFHpIOXXrLYl+1FzzD7O/4sE4hm72PwkcWjgxzkmJUQ6bBAFVbbeYsuHT
 ejPQKEvQVbfI/w3xbvr/dPSrG/XdPNeZmyTCD3PcFpxszwtM5uxd8pYsoPg6K6iYqm7FluIxWw7
 05R6+qIvUll7qUahFdYxJgFGO0ykLVGDJhvA/335PCorsZfMtndP4zFdbWqYzmvB8EnXBNaIfY9
 1lBxAdXm5SH5JqUqOdQWAjdRjpd69PBqiz5wTvpjta1bcn85fzYNaO6XFCvPASAas3Q6Y+nrntc
 w/s9N2yuOUGyimZHtu3KJlbxHJODeVQ6IBS5JHn3ye7jMhRM6qICJC4sy+KMRL598asK3LIT0wQ
 vIjkpJQjK6SpvPdxYfyb3M0Ny3JjWA1924Z/Q5uFBHMWPSeDL06yauoQ7bLlGhZozt4xQkPjRBp
 h/JYYOSaZAVr2aDzIKQGzRPB+lwJP0so6VmQo=
X-Received: by 2002:a05:620a:c53:b0:8cb:72b2:2a14 with SMTP id
 af79cd13be357-8cb8c9dfda9mr1415440985a.16.1771905933750; 
 Mon, 23 Feb 2026 20:05:33 -0800 (PST)
X-Received: by 2002:a05:620a:c53:b0:8cb:72b2:2a14 with SMTP id
 af79cd13be357-8cb8c9dfda9mr1415437785a.16.1771905933106; 
 Mon, 23 Feb 2026 20:05:33 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4c530sm1913135e87.83.2026.02.23.20.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 20:05:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate()
 allocation type
Date: Tue, 24 Feb 2026 06:05:25 +0200
Message-ID: <177190591481.429979.14151274658881021527.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260206222151.work.016-kees@kernel.org>
References: <20260206222151.work.016-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8I0LCKQ-cTy9vIlqzSWhTiJ_rrksbNb4
X-Proofpoint-ORIG-GUID: 8I0LCKQ-cTy9vIlqzSWhTiJ_rrksbNb4
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699d238e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=HIUXOl7pohhbnBzAbCMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzMSBTYWx0ZWRfXyoKjOclyD+4W
 pmotytoOZ+ea66E57D7g0buP3a9EB19qhVry/KiUK4lM6xlmQO+UR8v8Lld5eBKdp6NAeHTM4mL
 hnjddcvqirZJ5IbiR8FJ2B2pRFY/zlOWVnBjiKZ6csUKYQRGxPQUygmpVsFB1uQ/ILSlMVqEeKj
 7zYyrjAaZfRcF23Ge62IKLsGlUIsMXbrqoLUcU+5ZANHj6ZfBxqdI9eOh68ZUu7EFuDwmv9nxXW
 Fvv5LcRGYGDAN0aEddRaFg00iHm10wPf4wXyaRCKZqYYMTMQp6vC5RQWxPUrROPhD1+4SfvGoxv
 9jyChPS9QH7wipewUf/H42o83TkAv0A9lcyyLTKn1gLpU/BMKoJUVFd9yUV+Q2zMz2QWdx+hXwh
 O/5bweWGoqww5wg3yEXvyYiOjZ3jleWk3k+clBofyP7igJjgJkbpI+5jDgpiWltRET2g4n4yn03
 hfCvpvC+nM8YCEwnwgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240031
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:kees@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 527501818A9
X-Rspamd-Action: no action

On Fri, 06 Feb 2026 14:21:52 -0800, Kees Cook wrote:
> In preparation for making the kmalloc family of allocators type aware,
> we need to make sure that the returned type from the allocation matches
> the type of the variable being assigned. (Before, the allocator would
> always return "void *", which can be implicitly cast to any pointer type.)
> 
> The assigned type is "void **" but the returned type will be "void ***".
> These are the same allocation size (pointer size), but the types do not
> match. Adjust the allocation type to match the assignment.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate() allocation type
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6f6f3535192d

Best regards,
-- 
With best wishes
Dmitry


